import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

class ResultPredict extends StatefulWidget {
  const ResultPredict({Key? key}) : super(key: key);

  @override
  State<ResultPredict> createState() => _ResultPredictState();
}

class _ResultPredictState extends State<ResultPredict> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BEEP BEEP!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '소요 예상 시간'
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    '1시간 30분(예시)',
                    style: TextStyle(fontSize: 40),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                const Text(
                  '내가 입력한 정보',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  '*나의 이력에서 조회 가능',
                  style: TextStyle(fontSize: 10),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

//   resultPredict() async{
//   var url =Uri.parse(
//     'http://localhost:8080/Rserve/response_iris.jsp?sepalLength=$sepalLength&sepalWidth=$sepalWidth&petalLength=$petalLength&petalWidth=$petalWidth'
//   );
//   var response =await http.get(url);
//   setState(() {
//     var dataConvertedJSON =json.decode(utf8.decode(response.bodyBytes));
//     result = dataConvertedJSON['result'];
//     if(result == 'setosa'){
//       irisPath = 'images/setosa.jpg';
//     }else if(result == 'versicolor'){
//       irisPath = 'images/versicolor.jpg';
//     }else if(result == 'virginica'){
//       irisPath = 'images/virginica.jpg';
//     }
//     // 비동기 처리로 인해 같이 넣어줘야 함
//     _showResult(context);
//   });
  
// }


}