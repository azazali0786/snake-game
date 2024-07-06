
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'snake_state.dart';

class SnakeCubit extends Cubit<SnakeState> {
  SnakeCubit() : super(SnakeState.initial()) {
    moveSnake();
  }

  void moveSnake() {
    Future.delayed(const Duration(milliseconds: 300), () {
      List<List<int>> newSnake = List.from(state.snake);
      List<int> newHead = List.from(newSnake.first);

      switch (state.direction) {
        case Direction.up:
          newHead[0]--;
          break;
        case Direction.down:
          newHead[0]++;
          break;
        case Direction.left:
          newHead[1]--;
          break;
        case Direction.right:
          newHead[1]++;
          break;
      }

      if (newHead[0] < 0 || newHead[0] >= state.rowCount ||
          newHead[1] < 0 || newHead[1] >= state.colCount ||
          newSnake.any((part) => part[0] == newHead[0] && part[1] == newHead[1])) {
        emit(state.copyWith(isGameOver: true));
        return;
      }

      newSnake.insert(0, newHead);

      if (newHead[0] == state.food[0] && newHead[1] == state.food[1]) {
        placeFood();
      } else {
        newSnake.removeLast();
      }

      emit(state.copyWith(snake: newSnake));
      moveSnake();
    });
  }

  void changeDirection(Direction newDirection) {
    if (state.isGameOver) return;
    emit(state.copyWith(direction: newDirection));
  }

  void placeFood() {
    final random = Random();
    List<int> newFood;
    do {
      newFood = [random.nextInt(state.rowCount), random.nextInt(state.colCount)];
    } while (state.snake.any((part) => part[0] == newFood[0] && part[1] == newFood[1]));
    emit(state.copyWith(food: newFood));
  }

  void restartGame() {
    emit(SnakeState.initial());
    moveSnake();
  }
}
