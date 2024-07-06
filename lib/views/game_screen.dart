import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/snake_cubit.dart';
import '../widgets/snake_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Snake Game'),
      ),
      body: BlocConsumer<SnakeCubit, SnakeState>(
        listener: (context, state) {
          if (state.isGameOver) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Game Over'),
                content: const Text('You lost!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<SnakeCubit>().restartGame();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Restart'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              ElevatedButton(
                    onPressed: () => context.read<SnakeCubit>().restartGame(),
                    child: const Text('Restart'),
                  ),
              const Expanded(
                child: SnakeBoard(),
              ),
              ElevatedButton(
                    onPressed: () => context.read<SnakeCubit>().changeDirection(Direction.up),
                    child: const Text('Up'),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  ElevatedButton(
                    onPressed: () => context.read<SnakeCubit>().changeDirection(Direction.left),
                    child: const Text('Left'),
                  ),
                  
                  ElevatedButton(
                    onPressed: () => context.read<SnakeCubit>().changeDirection(Direction.right),
                    child: const Text('Right'),
                  ),
                  
                ],
              ),
              ElevatedButton(
                    onPressed: () => context.read<SnakeCubit>().changeDirection(Direction.down),
                    child: const Text('Down'),
                  ),
               SizedBox(height: MediaQuery.of(context).size.height*0.09,)
            ],
          );
        },
      ),
    );
  }
}
