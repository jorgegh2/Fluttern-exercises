import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Scrollbar(
          child: ListView(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Image.asset(
                      "assets/IndianMadder.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 25,
                    bottom: -25,
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.green,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: Colors.white,
                            ),
                            child: Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    BoxInit(),
                    PlantCircle(),
                    SizedBox(
                      height: 310,
                    )
                  ],
                ),
              ),
              TextBox(
                  title: "Description",
                  text:
                      "Madder Indian is a perennial climbing herb, that can grow to 1.5 m in height. The evergreen leaves are 5-10 cm long and 2-3 cm broad, produced in whorls of 4-7 starlike around the central stem. \nLeaves are ovate-heartshaped, entire, pointed, heart-shaped at base, rarely rounded, 3-9 palmately veined, upper surface mostly hairless and rough. It climbs with tiny hooks at the leaves and stems. The flowers are small, 3-5 mm across, with five greenish-yellow or pale yellow petals, in dense racemes. \nFruit is a small red to black berry, 4-6 mm diameter. The roots can be over a meter long, up to 12 mm thick."),
              TextBox(
                title: "Nutritional Value",
                text:
                    "Identification of aroma compounds in dried roots of Rubia cordifolia done by gas chromatography, accounting for 91.5% of total oil detected: \n\n● Mollugin 19.6% \n● Furomollugin 17.4%  \n● Eugenol 12.7% \n● (E)-anethole 10.6% \n● 4-tert-butyl-2-phenyl phenol 9.9% \n● Menthol 2.7%\n\nInformation on the nutritional value is limited. Further study should be done.",
              ),
              TextBox(
                title: "Health Benefits",
                text:
                    "1- Anti-cancer:\nIndian madder has traditionally been used to treat uterine and ovarian cancers. It can act against cancer cells in the colon, breast, and liver. It also has anti-tumour activity against various cancers such as myeloid leukaemia and histolytic lymphoma. The cyclic hexapeptides and quinones present in this plant may responsible for its anti-cancer activity. The methanol fraction of the plant extract exhibited potent inhibition of human cervical cancer cell line and larynx carcinoma cell line. Thus, Indian madder can be a source of potent pharmacophore for cancer.\n\n2- Anti-inflammatory:\nIndian madder is an anti-inflammatory herb that is effective in treating inflammatory associated with arthritis or any other forms of joint pains. It is important for inflammation to be stopped because inflammation is an early stage of most diseases.\n\n3- Treats Diarrhea:\nIndian madder is very useful to treats diarrhea. It improves digestive fire due to its appetizer and digestive properties. This makes the stool thick and reduces the frequency of motion. It also controls bleeding because of its astringent nature.\n\n4- Treats Urolithiasis:\nIndian madder helps to treat urolithiasis, which is kidney stones. This benefit is contributed by ruberythric acid in the plant, which is a substance that tones down calcium and magnesium as well as the formation of bladder stones in the long run. Indian madder is a good antispasmodic agent, which allows kidney stones to pass through the urinary system with less pain.\n\n5- Treats Cough:\nIndian madder helps to treats cough due to its expectorant properties that react very quickly. An expectorant is a medicine that encourages the release of sputum by the air passages. Sputum is a mixture of saliva and mucus formed in the respiratory tract, such as phlegm.\n\n6- Anti-arthritic:\nThe anthraquinones rich fraction of ethanolic extract of Indian madder has imperative anti-arthritic potential which is similar to aspirin, a standard non-steroidal anti-inflammatory drug.\n\n7- Heals Wounds:\nThe root extract of Indian madder is rich with wound healing property. The ethanolic extract and the hydrogel formulation of roots are effective in the functional recovery and healing of wounds as well as lead to histopathological alterations.\n\n9- Supports Stomach Health:\nIndian madder has both gastroprotective and ulcer healing properties. Triterpenoids present in root extracts are potent antiulcer and antioxidant compound.\n\nConsumption of Indian madder may reduce ulcer index, lipid peroxidation, and glutathione in stomach tissue.\n",
              ),
              TextBox(
                title: "Other Uses",
                text:
                    "- Red dye is obtained from the stems and the root. It is used for dyeing wool, silk, linen and cotton fabrics, as well as basket-making material.\n\n- Plant is traditionally grown in living fences in the northwestern Himalayas, where it helps to exclude livestock and other animals.\n\n- Juice of crushed fruits is bottled and used as green to bluish ink.\n\n- Ash of burnt stems and leaves is used as vegetable salt to soften vegetables when cooking in Tanzania.\n\n- Indian madder can be used as an ornamental climber, but in cultivated fields, it can behave as a troublesome weed.",
              ),
              TextBox(
                title: "Warnings",
                text:
                    "- Pregnant women should not take Indian madder internally. It might trigger menstruation and might lead to miscarriage.\n\n- Indian madder should not be used by nursing mothers and might cause breast milk to become red.\n\n- It may change the colour of the urine, saliva, perspiration, tears, and breast milk.\n\n- Indian madder supplements may interact with blood thinners like warfarin and coumadin.\n\n- There are also compounds in the plant that are known to cause cancer if taken orally. It can also cause restlessness and constipation. Use Indian madder using the recommended dosage.",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  final String title;
  final String text;
  TextBox({@required this.title, @required this.text});

  @override
  State<StatefulWidget> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            width: 375,
            color: Colors.grey[350],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.content_copy),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      width: 1,
                      height: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.share),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 1),
                  width: 373,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.text,
                        maxLines: show ? null : 10,
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        child: Text(
                          show ? "less.." : "more..",
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoxInit extends StatelessWidget {
  const BoxInit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 61,
      child: Container(
        width: 376,
        color: Colors.grey, 
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              width: 375,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.warning),
                      Spacer(),
                      Icon(Icons.attach_file)
                    ],
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextCamp(
                        textBold: "Family:",
                        description: "Rubiaceae",
                      ),
                      TextCamp(
                        textBold: "Other Name:",
                        description:
                            "Aromatic madder, Bengal madder, Indian madder, Madderwort, Rubia root, Munjeet",
                      ),
                      TextCamp(
                        textBold: "Used Part:",
                        description: "Roots, Leaves, Stems",
                      ),
                    ],
                  ),
                ],
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class TextCamp extends StatelessWidget {
  final String textBold;
  final String description;

  TextCamp({this.textBold, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          textBold,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(description),
      ],
    );
  }
}

class PlantCircle extends StatelessWidget {
  const PlantCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 128,
            width: 128,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.green[300],
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 122,
                  height: 122,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: Colors.green[200],
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        width: 115,
                        height: 115,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          image: DecorationImage(
                            image: AssetImage('assets/CircleImage.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Indian Madder",
            style: TextStyle(
              color: Colors.green[600],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
