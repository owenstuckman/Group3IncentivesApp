/*
Database helpers is just used to store various functions used throughout the app
- just a helper class to prevent having to remake code for basic database functionality
- also centralizes all interactions with the database
 */

// create variable for database which will be accessed later
import 'package:supabase_flutter/supabase_flutter.dart';

final SupabaseClient supabase = Supabase.instance.client;
class DataBase {

  // lists and maps to pass data to
  static List<Map> scanned_items = [];
  static Map items_information = {};

  // initialization of db
  static Future<void> init() async {
    await _tryInitialize();
  }

  // try to init, try catch for erros
  static Future<bool> _tryInitialize() async {
    try {
      await Supabase.initialize(
        // url and anonkey of supabase db
        url: 'https://zmqjskgfggxxmpfhygni.supabase.co',
        anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InptcWpza2dmZ2d4eG1wZmh5Z25pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzAzODM1NTcsImV4cCI6MjA0NTk1OTU1N30.So0-6hvuRcrW89GkzIOdaQhkA0k22QlFc4ev3zKSgqY',
      );
      return false;
    } catch(e){
      return true;
    }
  }

  // get points for a given hokieP
  static Future<int> getPoints(int hokieP) async {
    final points = await supabase.from('Accounts').select().eq('hokieP', hokieP);
    return points as int;
  }

  // update total amount of points for a hokieP
  static Future<int> updatePointTotal(int hokieP, int pointTotal) async {
    final points = await supabase.from('Accounts').update({'points' : pointTotal}).eq('hokieP', hokieP);
    return points as int;
  }

  // get scanned items for a given hokieP
  static Future<void> getScannedItems(int hokieP) async {
    scanned_items = await supabase.from('ScannedItems').select().eq('hokieP', hokieP);
  }
  
  // get info for a set item -> use getscanneditems to get items scanned
  static Future<void> getItemInformation(String barcodeID) async {
    items_information = (await supabase.from('ItemsKickbacks').select().eq('barcodeID', barcodeID)) as Map;
  }
}