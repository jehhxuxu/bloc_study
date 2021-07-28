import 'package:bloc_challenge/bloc/intoxianime_bloc.dart';
import 'package:bloc_challenge/bloc/intoxianime_event.dart';
import 'package:bloc_challenge/bloc/intoxianime_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<IntoxiAnimeBloc>(
        create: (context) => IntoxiAnimeBloc()..add(FetchAnimes()),
        child: MyHomePage(title: 'Bloc Challenge'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  late IntoxiAnimeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<IntoxiAnimeBloc>();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= (maxScroll * 0.7)) {
      _bloc.add(FetchAnimes());
    }
  }

  void getMoreData(int index, int page) {
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 20 == 0 && itemPosition != 0;
    final pageToRequest = itemPosition ~/ 20;
    if (requestMoreData && pageToRequest + 1 >= page) _bloc.add(FetchAnimes());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<IntoxiAnimeBloc, IntoxianimeState>(
        builder: (context, state) {
          if (state.status == InfoState.failure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ops, ocorreu algum erro'),
                  ElevatedButton(
                    onPressed: () => _bloc.add(FetchAnimes()),
                    child: Text('Tente novamente'),
                  )
                ],
              ),
            );
          }
          if (state.status == InfoState.success)
            return ListView.builder(
              //controller: _scrollController,
              itemCount: state.animes.length,
              itemBuilder: (context, index) {
                getMoreData(index, state.page);
                final anime = state.animes[index];
                return index == state.animes.length - 1
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : ListTile(
                        leading: Icon(Icons.image_outlined),
                        title: Text('${anime.title}'),
                        subtitle: Text('${anime.author}'),
                      );
              },
            );

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
