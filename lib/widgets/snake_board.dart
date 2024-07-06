import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/snake_cubit.dart';

class SnakeBoard extends StatelessWidget {
  const SnakeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SnakeCubit, SnakeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: state.rowCount * state.colCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.colCount,
            ),
            itemBuilder: (context, index) {
              final int row = index ~/ state.colCount;
              final int col = index % state.colCount;

              bool isSnakeBody = state.snake.any((part) => part[0] == row && part[1] == col);
              bool isFood = state.food[0] == row && state.food[1] == col;

              return Container(
                margin: const EdgeInsets.all(1),
                color: isSnakeBody ? Colors.green : isFood ? Colors.red : Colors.grey[300],
              );
            },
          ),
        );
      },
    );
  }
}
