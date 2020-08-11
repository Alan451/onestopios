import 'package:flutter/material.dart';

class IPCalculator extends StatefulWidget {
  static const String id='ipcalculator';
  @override
  _IPCalculatorState createState() => _IPCalculatorState();
}

class _IPCalculatorState extends State<IPCalculator> {
  String _hostel;//='None';
  String _block;
  String _floor;
  String _room;
  int _submit=0;
  var mp={
    'BARAK': '10',
    'BRAHMAPUTRA': '12',
    'DIBANG': '8',
    'DIHING': '0',
    'KAMENG': '9',
    'KAPILI': '1',
    'MANAS': '4',
    'SIANG': '3',
    'SUBHANSIRI': '16',
    'UMIAM': '11',
  };

  var mp1 = {
    'BARAK': '192',
    'BRAHMAPUTRA': '192',
    'DIBANG': '192',
    'DIHING': '252',
    'KAMENG': '252',
    'KAPILI': '252',
    'MANAS': '192',
    'SIANG': '252',
    'SUBHANSIRI': '192',
    'UMIAM': '192',
  };

  String stoi(String s, String h)
  {
    if(h=='DIBANG')
      {
        if(s=='A' || s=='B' || s=='C')
          return '0';
        if(s=='D' || s=='E' || s=='F')
          return '1';
        if(s=='G' || s=='H' || s=='I')
          return '2';
        if(s=='J' || s=='K' || s=='L')
          return '3';
      }
    if(s=='A')
      return '0';
    if(s=='B')
      return '1';
    if(s=='C')
      return '2';
    if(s=='D')
      return '3';
  }

  String rmn(String b, int r)
  {
    if(b=='A' || b=='D' || b=='G' || b=='J')
      return r.toString();
    if(b=='B' || b=='E' || b=='H' || b=='K')
      {
        int k=r+12;
        return k.toString();
      }
    if(b=='C' || b=='F' || b=='I' || b=='L')
    {
      int k=r+18;
      return k.toString();
    }
  }

  String ipgiver(String h, String b,String f,String r)
  {
    if(h=='LOHIT' || h=='DHANSIRI')
      return 'Your IP address is set automatically.';
    if(h=='DIBANG')
      {
        String ans= '10.8.' + stoi(b[0], h)+f[0]+ '.';
        String tmp=(r.length>=2)?r.substring(r.length-2):r.substring(r.length-1);
        ans=ans+rmn(b[0],int.parse(tmp));
        return 'Your IP address: '+ans;
      }
    else if(h=='BARAK' || h=='BRAHMAPUTRA' || h=='KAMENG' || h=='MANAS'
        || h=='SUBHANSIRI' || h=='UMIAM')
      {
        String ans='10.' + mp[h] +'.'+ stoi(b[0], h) + f[0] + '.';
        String tmp=(r.length>=2)?r.substring(r.length-2):r.substring(r.length-1);
        return 'Your IP address: '+ans+tmp;
      }
    else
      {
        String ans='10.' + mp[h] +'.'+f[0]+'.';
        String tmp=(r.length>=2)?r.substring(r.length-2):r.substring(r.length-1);
        return 'Your IP address: '+ans+tmp;
      }
    return 'Details not proper';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel IP Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child:  Column(
          children: <Widget>[
            DropdownButton(
                isExpanded: true,
                hint: Center(child: Text('Select Hostel --')),
                value: _hostel,
                items: [
                  DropdownMenuItem(
                    child: Center(
                      child: Text("DIHING"),
                    ),
                    value: "DIHING",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("BARAK")),
                    value: "BARAK",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("BRAHMAPUTRA")),
                    value: "BRAHMAPUTRA",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("DHANSIRI")),
                    value: "DHANSIRI",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("DIBANG")),
                    value: "DIBANG",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("KAMENG")),
                    value: "KAMENG",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("KAPILI")),
                    value: "KAPILI",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("LOHIT")),
                    value: "LOHIT",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("MANAS")),
                    value: "MANAS",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("SIANG")),
                    value: "SIANG",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("UMIAM")),
                    value: "UMIAM",
                  ),
                  DropdownMenuItem(
                    child: Center(child: Text("SUBHANSIRI")),
                    value: "SUBHANSIRI",
                  ),
                ],
                onChanged: (value) async {
                  setState(() {
                    _hostel = value;
                    _submit=0;
                  });
                }
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter the block'
              ),
              onChanged: (value){
                _block=value;
                _submit=0;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter the floor'
              ),
              onChanged: (value){
                _floor=value;
                _submit=0;
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter room no.'
              ),
              onChanged: (value){
                _room=value;
                _submit=0;
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            RaisedButton(
              child: Text(
                'Get Details',
                style: TextStyle(
                    color: Colors.blue
                ),
              ),
              onPressed: () {
                setState(() {
                  _submit=1;
                });
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            (_hostel==null || _block==null || _floor==null ||
                _room==null || _submit==0)?Container():
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                        ipgiver(_hostel,_block,_floor,_room)
                    ),
                  ),
                  (_hostel=='LOHIT' || _hostel=='DHANSIRI')?
                      Container():Container(
                    child: Text(
                        'Your Default Gateway: 10.' + mp[_hostel] + '.0.254'
                    ),
                  ),
                  (_hostel=='LOHIT' || _hostel=='DHANSIRI')?
                  Container(): Container(
                    child: Text(
                        'Your Subnet mask: 255.255.' + mp1[_hostel] + '.0'
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
