import 'package:flutter/material.dart';

import 'package:http/http.dart' as http; // http import
import 'package:fl_chart/fl_chart.dart'; // 차트 임포트임 없으면 차트 못 그림ㅋㅋ
import 'dart:convert'; // json decode 때문

import 'package:upstock/home/homebody.dart';
import 'package:upstock/home/homeheader.dart'; // json import

// 다우존스랑 나스닥 100 정보 가져올거임
Future<List<Map<String, dynamic>>> getStockData() async {
  // 정보 늦으니까 await, Future 쓰고 Json Map 자료니까 타입 선언도 같이해줘야 함

  // 다우존스랑 나스닥 심볼 적어놔야 부르지 ㅇㅈ?
  final symbol = {'다우존스': '^DJI', '나스닥': '^NDX'};

  // 데이터 가져올 때에는 여러가지 동시에
  return Future.wait(symbol.entries.map((name) async {
    // 1일 데이터 가져오기 name.value는 심볼의 티커 가져오는거임 ㅇㅇ
    var result = await http.get(Uri.parse(
        'https://query1.finance.yahoo.com/v8/finance/chart/${name.value}?range=1d&interval=5m'));

    // null 체크해주래
    if (result.statusCode != 200) {
      print('오류나는디');
    }

    // jsondecode을 쓰는 이유는 json에서 데이터 내가 쓰려고 ㅋㅋ
    var data = jsonDecode(result.body)['chart']['result'][0];
    var prices = data['indicators']['quote'][0]['close'];
    // todo : 야후 파이낸스 api json 파일 양식 참고해서 추가적인 데이터 추가해야 함

    return {
      'symbol': name.key, // 심볼 이름임 굳이 지금은 필요없는데, 혹시 몰라서 나중에 쓸거 같음
      'currentPrice': prices.last, // 최근 가격 전날 가격임
      'prices': ((prices.last - prices[prices.length - 2]) /
              prices[prices.length - 2]) *
          100, // 최근 가격
      'changePercent': List.generate(prices.length,
          (i) => FlSpot(i.toDouble(), prices[i]?.toDouble() ?? 0))
      // 등락률 계산, flospot은 x랑 y축
    };
  }));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> stockData = []; // 주식 데이터를 저장할 리스트

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // 내용 많아질건데 미리 스크롤뷰 넣자잉
        // todo Sliver Appbar 써서 나중에 디자인

        body: CustomScrollView(
          // sliver [위젯 1, 위젯 2]
          slivers: [

            // 위젯 1
            HomeHeader(stockData: stockData, getStockData: getStockData),

            // 위젯 2 - 커스텀 리스트뷰
            HomeBody()

          ], // sliver
        ));
  }
}
