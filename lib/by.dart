import 'dart:io';

int changer = 0;
String name = "";
List<int> rannum = [
  111111,
  123456,
  999999,
  125355,
  835022,
  789454,
  321465,
  984566,
  144854,
  129854,
  789123,
  456127,
  142536
];
List<Map<String, dynamic>> db1 = [
  {'tno': 't100', 'from': 'Aluva', 'to': 'Goa', 'date': '12/11/2022'},
  {'tno': 't200', 'from': 'Mumbai', 'to': 'Goa', 'date': '20/10/2022'},
  {'tno': 't300', 'from': 'Trivandrum', 'to': 'Kollam', 'date': '15/09/2022'},
  {'tno': 't400', 'from': 'Bangalore', 'to': 'Palakkad', 'date': '06/01/2022'},
  {'tno': 't500', 'from': 'Thrissur', 'to': 'Chennai', 'date': '12/04/2022'}
];
//db1.add( {'Starting': 'd', 'Destination': 'd', 'Date': '12-11-2012'});
List<Map<String, dynamic>> db2 = [];
List<Map<String, dynamic>> db3 = [
   {'tno': 't100', 'sn': 5},
   {'tno': 't200', 'sn': 6},
   {'tno': 't300', 'sn': 4},
   {'tno': 't400', 'sn': 3},
   {'tno': 't500', 'sn': 7},
];
List<Map<String, dynamic>> db4 = [
  {'tno': 't100', 'from': 'Aluva', 'to': 'Goa', 's1': "Trivandrum",'s2':"Palakkad", 's3': "Mysore",'s4':"Bangalore"},
  {'tno': 't200', 'from': 'Mumbai', 'to': 'Goa', 's1': "Chhatrapati Shivaji",'s2':"Dadar Central", 's3': "Lokamanya Tilak",'s4':"Bangalore"},
  {'tno': 't300', 'from': 'Trivandrum', 'to': 'Kollam', 's1': "Eravipuram",'s2':"Mayyanad", 's3': "Paravur",'s4':"Akathumuri"},
  {'tno': 't400', 'from': 'Bangalore', 'to': 'Palakkad', 's1': "Bandabanshadi",'s2':"Mysore", 's3': "Chennai",'s4':"Coimbatore"},
  {'tno': 't500', 'from': 'Thrissur', 'to': 'Chennai', 's1': "Palakkad",'s2':"Shornur", 's3': "Tirur",'s4':"Mangalore"},
];

