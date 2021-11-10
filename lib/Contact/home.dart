import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jiwdopani/UserLogIn/MenuUse.dart';
import 'contact.dart';
import 'credits.dart';
import 'procontact.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createProfileImage(ProContact promoters) =>
            Hero(
            tag: promoters.procontactName,
            child: Column(children: <Widget>[
              Material(
                child: InkWell(
                  // onTap: () {
                  // Navigator.pushNamed(
                  //     context, 'ares/${promoters.procontactName}');
                  // },
                    child:Container(child:Column(children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  promoters.procontactImage),
                            )
                        ),
                      ),
                      SizedBox(height:10),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              promoters.procontactName,
                              style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight:FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              promoters.proChurch,
                              style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight:FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              promoters.proEmail,
                              style: TextStyle(color: Colors.black, fontSize: 11.0,fontWeight:FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              promoters.ProAddress,
                              style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight:FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              promoters.ProPhone,
                              style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight:FontWeight.bold)),
                        ),
                      ),
                    ],),)
                ),
              ),

            ],)
        );

    final PromotersGrid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(top: 8.0),
          sliver: SliverGrid.count(
            childAspectRatio: 1,
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            children: promoters.map((promoter) => createProfileImage(promoter)).toList(),
          ),
        )
      ],
    );


    createCreditsProfile(Credits credits) =>
        Hero(
            tag: credits.creditsName,
            child: Column(children: <Widget>[
              Material(
                child: InkWell(
                  //  onTap: () {
                  // Navigator.pushNamed(
                  //   context, 'ares/${credits.creditsName}');
                  //  },
                    child:Container(child:Column(children: <Widget>[
                      Container(
                        width: 115,
                        height: 115,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  credits.creditsImage),
                            )
                        ),
                      ),
                      SizedBox(height:10),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              credits.creditsName,
                              style: TextStyle(color: Colors.black, fontSize: 14.0,fontWeight:FontWeight.bold)),
                        ),
                      ),

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              credits.creditsChurch,
                              style: TextStyle(color: Colors.black, fontSize: 13.0,fontWeight:FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              credits.creditsAddress,
                              style: TextStyle(color: Colors.black, fontSize: 12,fontWeight:FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                              credits.creditsDesignation,
                              style: TextStyle(color: Colors.black, fontSize: 12.0,fontWeight:FontWeight.bold)),
                        ),
                      ),


                    ],),)
                ),
              ),

            ],)
        );

    final CreditsGrid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.only(top: 8.0),
          sliver: SliverGrid.count(
            childAspectRatio: 1,
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            children: credits.map((credits) => createCreditsProfile(credits)).toList(),
          ),
        )
      ],
    );

    ProfileList(Contact contact) =>
        Hero(


          tag: contact.contactName,
                     child: Container(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                contact.contactImage),
                          )
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, 'contactdetails/${contact.contactName}');
                        },
                      ),
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          contact.contactName,
                          style: TextStyle(
                              color: Colors.black, fontSize: 24.0)),
                    ),
                  ),


                ],),
              ),
            ),
          ),
        );

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          appBar: AppBar(
            leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),  onPressed: () => Navigator.push(context,MaterialPageRoute(builder:(context)=>UserMenu()))),
            title: Text("Contacts"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(FontAwesomeIcons.solidAddressBook), onPressed: () {

              }
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(child: Text('Executive Members', style: TextStyle(color: Colors.white)),),
                Tab(child: Text('Promoters',style: TextStyle(color: Colors.white)),),
                Tab(child: Text(
                    'Credits', style: TextStyle(color: Colors.white)),),


              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(


                child: ListView(

                  scrollDirection: Axis.vertical,
                  children: contacts.map((contact) => ProfileList(contact))
                      .toList(),

                ),
              ),

            Container(


                // child: ListView(
               // scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                // children: promoters.map((promoter) => PromoterProfileList(promoter))
                //.toList(),
                child: PromotersGrid,
              ),
              Container(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                // children: promoters.map((promoter) => PromoterProfileList(promoter))
                //.toList(),
                child: CreditsGrid,
              ),
            ],
          ),

        ),
      ),
    );
  }
}

