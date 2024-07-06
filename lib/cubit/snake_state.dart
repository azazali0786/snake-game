part of 'snake_cubit.dart';

enum Direction { up, down, left, right }

class SnakeState {
  final List<List<int>> snake;
  final Direction direction;
  final List<int> food;
  final bool isGameOver;
  final int rowCount;
  final int colCount;

  SnakeState({
    required this.snake,
    required this.direction,
    required this.food,
    required this.isGameOver,
    required this.rowCount,
    required this.colCount,
  });

  factory SnakeState.initial() {
    return SnakeState(
      snake: [[10, 10]],
      direction: Direction.right,
      food: [15, 15],
      isGameOver: false,
      rowCount: 20,
      colCount: 20,
    );
  }

  SnakeState copyWith({
    List<List<int>>? snake,
    Direction? direction,
    List<int>? food,
    bool? isGameOver,
  }) {
    return SnakeState(
      snake: snake ?? this.snake,
      direction: direction ?? this.direction,
      food: food ?? this.food,
      isGameOver: isGameOver ?? this.isGameOver,
      rowCount: rowCount,
      colCount: colCount,
    );
  }
}
