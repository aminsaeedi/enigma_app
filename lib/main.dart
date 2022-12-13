import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:numberpicker/numberpicker.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black54,
      ),
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String alpabet="abcdefghijklmnopqrstuvwxyz";
  String r1="ertyuiopqwasdfghjklzxcvbnm";
  String r2="mnbvcxzasdfghjklpoiuytrewq";
  String r3="qazxswedcvfrtgbnhymujkiolp";
  int _currentValue1=1;
  int _currentValue2=1;
  int _currentValue3=1;
 late String code;
   String answer="";

   int state=0;




  String reflector(String a){
int  x= 26-alpabet.indexOf(a)-1;
  return alpabet[x];
}

String anigma_roters(String char){
 String c1=r1[alpabet.indexOf(char)];
 String c2=r2[alpabet.indexOf(c1)];
 String c3=r3[alpabet.indexOf(c2)];
 String ref=reflector(c3);
 String b1=alpabet[r3.indexOf(ref)];
 String b2=alpabet[r2.indexOf(b1)];
 String b3=alpabet[r1.indexOf(b2)];
 return b3;
}

void roter_ro(){
    String s=r1[0];
    r1= r1.replaceAll(r1[0], "");
    r1 +=s;
    if(state%26==0){
      String f=r2[0];
      r2= r2.replaceAll(r2[0], "");
      r2 +=f;
    }
    if(state%(26*26)==0){
      String g=r3[0];
      r3=  r3.replaceAll(r3[0], "");
      r3 +=g;
    }
}



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Enigma App")),

      ),


      body: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple,
                          width: 4)
                  ),
                  child: Column(
                    children: [
                      const Text("roter3",style: TextStyle(color: Colors.deepPurple)),
                      NumberPicker(
                        itemHeight: 30,
                        itemWidth: 25,
                        value: _currentValue3,
                          minValue: 1,
                        maxValue: 3,
                        onChanged: (value) {
                          setState(() {
                            _currentValue3 = value;
                          });

                          switch(value) {
                            case 1: {
                            r3="qazxswedcvfrtgbnhymujkiolp";
                            }
                            break;

                            case 2: {
                             r3="azxswedcvfrtgbnhymujkiolpq";
                            }
                            break;

                            case 3: {
                            r3="zxswedcvfrtgbnhymujkiolpqa";
                            }
                            break;

                            default: {
                              //statements;
                            }
                            break;
                          }


                        }
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple,
                      width: 4)
                  ),
                  child: Column(
                    children: [
                      const Text("roter2",style: TextStyle(color: Colors.deepPurple)),
                      NumberPicker(
                          itemHeight: 30,
                          itemWidth: 25,
                        value: _currentValue2,
                          minValue: 1,
                        maxValue: 3,
                          onChanged: (value) {
    setState(() {
      _currentValue2 = value;
    });
                            switch(value) {
                              case 1: {
                                r2="mnbvcxzasdfghjklpoiuytrewq";
                              }
                              break;

                              case 2: {
                                r2="nbvcxzasdfghjklpoiuytrewqm";
                              }
                              break;

                              case 3: {
                                r2="bvcxzasdfghjklpoiuytrewqmn";
                              }
                              break;

                              default: {
                                //statements;
                              }
                              break;
                            }


                          }
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple,
                          width: 4)
                  ),
                  child: Column(
                    children: [
                      const Text("roter1",style: TextStyle(color: Colors.deepPurple)),
                      NumberPicker(
                          itemHeight: 30,
                          itemWidth: 25,
                        value: _currentValue1,
                        minValue: 1,
                        maxValue: 3,
                          onChanged: (value) {
                            setState(() {
                              _currentValue1 = value;
                            });

                            switch(value) {
                              case 1: {
                                r1="ertyuiopqwasdfghjklzxcvbnm";
                              }
                              break;

                              case 2: {
                                r1="rtyuiopqwasdfghjklzxcvbnme";
                              }
                              break;

                              case 3: {
                                r1="tyuiopqwasdfghjklzxcvbnmer";
                              }
                              break;

                              default: {
                                //statements;
                              }
                              break;
                            }


                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'inter your code:',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-70,
              child: TextFormField(
                onChanged: (value){
               code=value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('code',style: TextStyle(color: Colors.deepPurple)),
              ),),
            ),
            const SizedBox(
              height: 10,
            ),

            ElevatedButton(onPressed: ()async{
               answer="";
              for(int i=0;i<code.length;i++){
                if(code[i]==" "){
                  answer += " ";
                }else{
               answer += anigma_roters(code[i]);
               state++;
               roter_ro();
                }
              }
               setState(() {
                alpabet="abcdefghijklmnopqrstuvwxyz";
                r1="ertyuiopqwasdfghjklzxcvbnm";
                r2="mnbvcxzasdfghjklpoiuytrewq";
                r3="qazxswedcvfrtgbnhymujkiolp";
                 _currentValue1=1;
                 _currentValue2=1;
                 _currentValue3=1;
                 state=0;
              });



            }, child: const Text("decode")),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width-40,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple,
                        width: 4)
                ),
                child: Text(answer)),
            ElevatedButton(onPressed: (){
              FlutterClipboard.copy(answer);

            }, child: const Text("copy")),
          ],
        ),
      ),

    );
  }
}
