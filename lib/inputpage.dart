import './constants.dart';
import './resultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './iconContent.dart';
import './reusableCard.dart';
//import './resultPage.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


const inactiveCardColour=Color(0xFF111328);
enum Gender {male,female}

class _InputPageState extends State<InputPage> {

 // Color maleCardColour=inactiveCardColour;
 // Color femaleCardColour=inactiveCardColour;
  Gender selectedGender;
  int height=180;
  int weight =60;
  int age=20;
/*
  void updateColour(Gender gender){
    if(gender==Gender.male){
      if(maleCardColour==inactiveCardColour){
        maleCardColour=Color(0xFF1D1E33);
        femaleCardColour=inactiveCardColour;
      }else {maleCardColour=inactiveCardColour;}
    }
    if(gender==Gender.female) {
      if(femaleCardColour==inactiveCardColour){
        femaleCardColour=Color(0xFF1D1E33);
        maleCardColour=inactiveCardColour;
      }else {femaleCardColour=inactiveCardColour;}
    };
  }
*/
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR'),) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {setState(() {selectedGender=Gender.male;});},
                    colour: selectedGender==Gender.male? Color(0xFF1D1E33):inactiveCardColour ,
                    cardChild:IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                  ),
                ),

                Expanded(
                  
                  child: ReusableCard(
                    onPress: () {setState(() {selectedGender=Gender.female;});},
                    colour: selectedGender==Gender.female? Color(0xFF1D1E33):inactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: <Widget>[
                Text('HEIGHT' , style: labelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text('$height',style:numberTextStyle,),
                    Text('cm',style: labelTextStyle,),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 26),
                    overlayColor: Color(0x29EB1555)
                  ),
                  child: Slider(
                    value: height.toDouble() ,
                    min: 120,max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height=newValue.toInt();
                      });
                      print(newValue);
                    },
                   ),
                )
              ],),
              colour: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: labelTextStyle,),
                        Text('$weight',style: numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress:(){
                                setState(() {
                                  weight--;
                                });
                              } ,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPress:(){
                                setState(() {
                                  weight++;
                                });
                              } ,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: Color(0xFF1D1E33),
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: labelTextStyle,),
                        Text('$age',style: numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress:(){
                                setState(() {
                                  age--;
                                });
                              } ,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon:FontAwesomeIcons.plus,
                              onPress:(){
                                setState(() {
                                  age++;
                                });
                              } ,
                            )
                          ],
                        )
                      ], 
                    ),
                ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage()));
            },
                      child: Container(
              child: Text('CALCULATE'),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top :10),
              width: double.infinity,
              height: 80,
            ),
          ),
        ],
      ),
      
      
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPress;
  final IconData icon;
  RoundIconButton({this.icon,this.onPress});
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(icon , color: Colors.white,),
      backgroundColor: Color(0xFF4C4F5E),
      onPressed: onPress,                        
    );
    
  }
}




