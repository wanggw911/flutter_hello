import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconsEnumerateListPage extends StatefulWidget {
  IconsEnumerateListPage({Key key}) : super(key: key);

  _IconsEnumerateListPageState createState() => _IconsEnumerateListPageState();
}

class _IconsEnumerateListPageState extends State<IconsEnumerateListPage> {

  @override
  void initState() {
    super.initState();

    //页面加载
    WidgetsBinding.instance.addPostFrameCallback((_){ 
      _getAllCupertinoIcons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CupertinoIcons'),),
      body: Container(
        child: ListView.separated(
          itemCount: cupertinoIconsMapList.length,
          separatorBuilder: (context, index) {
            return Divider(height: 0.5, color: Colors.grey.shade200);
          },
          itemBuilder: (context, index) {
            Map map = cupertinoIconsMapList[index];
            return ListTile(
              leading: Icon(map.values.first as IconData),
              title: Text('${map.keys.first}'),
            );
          },
        ),
      ),
    );
  }
  
  void _getAllCupertinoIcons() {
    //getAllStaticProperties
    //CupertinoIcons._(); how this working
    //InstanceMirror instance_mirror = reflect();
    //CupertinoIcons cupertinoIcons = CupertinoIcons();
  }
}

List<Map<String, IconData>> cupertinoIconsMapList = [
  {"CupertinoIcons.left_chevron" : CupertinoIcons.left_chevron},
  {"CupertinoIcons.right_chevron" : CupertinoIcons.right_chevron},
  {"CupertinoIcons.share" : CupertinoIcons.share},
  {"CupertinoIcons.share_solid" : CupertinoIcons.share_solid},
  {"CupertinoIcons.book" : CupertinoIcons.book},
  {"CupertinoIcons.book_solid" : CupertinoIcons.book_solid},
  {"CupertinoIcons.bookmark" : CupertinoIcons.bookmark},
  {"CupertinoIcons.bookmark_solid" : CupertinoIcons.bookmark_solid},
  {"CupertinoIcons.info" : CupertinoIcons.info},
  {"CupertinoIcons.reply" : CupertinoIcons.reply},
  {"CupertinoIcons.conversation_bubble" : CupertinoIcons.conversation_bubble},
  {"CupertinoIcons.profile_circled" : CupertinoIcons.profile_circled},
  {"CupertinoIcons.plus_circled" : CupertinoIcons.plus_circled},
  {"CupertinoIcons.minus_circled" : CupertinoIcons.minus_circled},
  {"CupertinoIcons.flag" : CupertinoIcons.flag},
  {"CupertinoIcons.search" : CupertinoIcons.search},
  {"CupertinoIcons.check_mark" : CupertinoIcons.check_mark},
  {"CupertinoIcons.check_mark_circled" : CupertinoIcons.check_mark_circled},
  {"CupertinoIcons.check_mark_circled_solid" : CupertinoIcons.check_mark_circled_solid},
  {"CupertinoIcons.circle" : CupertinoIcons.circle},
  {"CupertinoIcons.circle_filled" : CupertinoIcons.circle_filled},
  {"CupertinoIcons.back" : CupertinoIcons.back},
  {"CupertinoIcons.forward" : CupertinoIcons.forward},
  {"CupertinoIcons.home" : CupertinoIcons.home},
  {"CupertinoIcons.shopping_cart" : CupertinoIcons.shopping_cart},
  {"CupertinoIcons.ellipsis" : CupertinoIcons.ellipsis},
  {"CupertinoIcons.phone" : CupertinoIcons.phone},
  {"CupertinoIcons.phone_solid" : CupertinoIcons.phone_solid},
  {"CupertinoIcons.down_arrow" : CupertinoIcons.down_arrow},
  {"CupertinoIcons.up_arrow" : CupertinoIcons.up_arrow},
  {"CupertinoIcons.battery_charging" : CupertinoIcons.battery_charging},
  {"CupertinoIcons.battery_empty" : CupertinoIcons.battery_empty},
  {"CupertinoIcons.battery_full" : CupertinoIcons.battery_full},
  {"CupertinoIcons.battery_75_percent" : CupertinoIcons.battery_75_percent},
  {"CupertinoIcons.battery_25_percent" : CupertinoIcons.battery_25_percent},
  {"CupertinoIcons.bluetooth" : CupertinoIcons.bluetooth},
  {"CupertinoIcons.restart" : CupertinoIcons.restart},
  {"CupertinoIcons.reply_all" : CupertinoIcons.reply_all},
  {"CupertinoIcons.reply_thick_solid" : CupertinoIcons.reply_thick_solid},
  {"CupertinoIcons.share_up" : CupertinoIcons.share_up},
  {"CupertinoIcons.shuffle" : CupertinoIcons.shuffle},
  {"CupertinoIcons.shuffle_medium" : CupertinoIcons.shuffle_medium},
  {"CupertinoIcons.shuffle_thick" : CupertinoIcons.shuffle_thick},
  {"CupertinoIcons.photo_camera" : CupertinoIcons.photo_camera},
  {"CupertinoIcons.photo_camera_solid" : CupertinoIcons.photo_camera_solid},
  {"CupertinoIcons.video_camera" : CupertinoIcons.video_camera},
  {"CupertinoIcons.video_camera_solid" : CupertinoIcons.video_camera_solid},
  {"CupertinoIcons.switch_camera" : CupertinoIcons.switch_camera},
  {"CupertinoIcons.switch_camera_solid" : CupertinoIcons.switch_camera_solid},
  {"CupertinoIcons.collections" : CupertinoIcons.collections},
  {"CupertinoIcons.collections_solid" : CupertinoIcons.collections_solid},
  {"CupertinoIcons.folder" : CupertinoIcons.folder},
  {"CupertinoIcons.folder_solid" : CupertinoIcons.folder_solid},
  {"CupertinoIcons.folder_open" : CupertinoIcons.folder_open},
  {"CupertinoIcons.delete" : CupertinoIcons.delete},
  {"CupertinoIcons.delete_solid" : CupertinoIcons.delete_solid},
  {"CupertinoIcons.delete_simple" : CupertinoIcons.delete_simple},
  {"CupertinoIcons.pen" : CupertinoIcons.pen},
  {"CupertinoIcons.pencil" : CupertinoIcons.pencil},
  {"CupertinoIcons.create" : CupertinoIcons.create},
  {"CupertinoIcons.create_solid" : CupertinoIcons.create_solid},
  {"CupertinoIcons.refresh" : CupertinoIcons.refresh},
  {"CupertinoIcons.refresh_circled" : CupertinoIcons.refresh_circled},
  {"CupertinoIcons.refresh_circled_solid" : CupertinoIcons.refresh_circled_solid},
  {"CupertinoIcons.refresh_thin" : CupertinoIcons.refresh_thin},
  {"CupertinoIcons.refresh_thick" : CupertinoIcons.refresh_thick},
  {"CupertinoIcons.refresh_bold" : CupertinoIcons.refresh_bold},
  {"CupertinoIcons.clear_thick" : CupertinoIcons.clear_thick},
  {"CupertinoIcons.clear_thick_circled" : CupertinoIcons.clear_thick_circled},
  {"CupertinoIcons.clear" : CupertinoIcons.clear},
  {"CupertinoIcons.clear_circled" : CupertinoIcons.clear_circled},
  {"CupertinoIcons.clear_circled_solid" : CupertinoIcons.clear_circled_solid},
  {"CupertinoIcons.add" : CupertinoIcons.add},
  {"CupertinoIcons.add_circled" : CupertinoIcons.add_circled},
  {"CupertinoIcons.add_circled_solid" : CupertinoIcons.add_circled_solid},
  {"CupertinoIcons.gear" : CupertinoIcons.gear},
  {"CupertinoIcons.gear_solid" : CupertinoIcons.gear_solid},
  {"CupertinoIcons.gear_big" : CupertinoIcons.gear_big},
  {"CupertinoIcons.settings" : CupertinoIcons.settings},
  {"CupertinoIcons.settings_solid" : CupertinoIcons.settings_solid},
  {"CupertinoIcons.music_note" : CupertinoIcons.music_note},
  {"CupertinoIcons.double_music_note" : CupertinoIcons.double_music_note},
  {"CupertinoIcons.play_arrow" : CupertinoIcons.play_arrow},
  {"CupertinoIcons.play_arrow_solid" : CupertinoIcons.play_arrow_solid},
  {"CupertinoIcons.pause" : CupertinoIcons.pause},
  {"CupertinoIcons.pause_solid" : CupertinoIcons.pause_solid},
  {"CupertinoIcons.loop" : CupertinoIcons.loop},
  {"CupertinoIcons.loop_thick" : CupertinoIcons.loop_thick},
  {"CupertinoIcons.volume_down" : CupertinoIcons.volume_down},
  {"CupertinoIcons.volume_mute" : CupertinoIcons.volume_mute},
  {"CupertinoIcons.volume_off" : CupertinoIcons.volume_off},
  {"CupertinoIcons.volume_up" : CupertinoIcons.volume_up},
  {"CupertinoIcons.fullscreen" : CupertinoIcons.fullscreen},
  {"CupertinoIcons.fullscreen_exit" : CupertinoIcons.fullscreen_exit},
  {"CupertinoIcons.mic_off" : CupertinoIcons.mic_off},
  {"CupertinoIcons.mic" : CupertinoIcons.mic},
  {"CupertinoIcons.mic_solid" : CupertinoIcons.mic_solid},
  {"CupertinoIcons.clock" : CupertinoIcons.clock},
  {"CupertinoIcons.clock_solid" : CupertinoIcons.clock_solid},
  {"CupertinoIcons.time" : CupertinoIcons.time},
  {"CupertinoIcons.time_solid" : CupertinoIcons.time_solid},
  {"CupertinoIcons.padlock" : CupertinoIcons.padlock},
  {"CupertinoIcons.padlock_solid" : CupertinoIcons.padlock_solid},
  {"CupertinoIcons.eye" : CupertinoIcons.eye},
  {"CupertinoIcons.eye_solid" : CupertinoIcons.eye_solid},
  {"CupertinoIcons.person" : CupertinoIcons.person},
  {"CupertinoIcons.person_solid" : CupertinoIcons.person_solid},
  {"CupertinoIcons.person_add" : CupertinoIcons.person_add},
  {"CupertinoIcons.person_add_solid" : CupertinoIcons.person_add_solid},
  {"CupertinoIcons.group" : CupertinoIcons.group},
  {"CupertinoIcons.group_solid" : CupertinoIcons.group_solid},
  {"CupertinoIcons.mail" : CupertinoIcons.mail},
  {"CupertinoIcons.mail_solid" : CupertinoIcons.mail_solid},
  {"CupertinoIcons.location" : CupertinoIcons.location},
  {"CupertinoIcons.location_solid" : CupertinoIcons.location_solid},
  {"CupertinoIcons.tag" : CupertinoIcons.tag},
  {"CupertinoIcons.tag_solid" : CupertinoIcons.tag_solid},
  {"CupertinoIcons.tags" : CupertinoIcons.tags},
  {"CupertinoIcons.tags_solid" : CupertinoIcons.tags_solid},
  {"CupertinoIcons.bus" : CupertinoIcons.bus},
  {"CupertinoIcons.car" : CupertinoIcons.car},
  {"CupertinoIcons.car_detailed" : CupertinoIcons.car_detailed},
  {"CupertinoIcons.train_style_one" : CupertinoIcons.train_style_one},
  {"CupertinoIcons.train_style_two" : CupertinoIcons.train_style_two},
  {"CupertinoIcons.paw" : CupertinoIcons.paw},
  {"CupertinoIcons.paw_solid" : CupertinoIcons.paw_solid},
  {"CupertinoIcons.game_controller" : CupertinoIcons.game_controller},
  {"CupertinoIcons.game_controller_solid" : CupertinoIcons.game_controller_solid},
  {"CupertinoIcons.lab_flask" : CupertinoIcons.lab_flask},
  {"CupertinoIcons.lab_flask_solid" : CupertinoIcons.lab_flask_solid},
  {"CupertinoIcons.heart" : CupertinoIcons.heart},
  {"CupertinoIcons.heart_solid" : CupertinoIcons.heart_solid},
  {"CupertinoIcons.bell" : CupertinoIcons.bell},
  {"CupertinoIcons.bell_solid" : CupertinoIcons.bell_solid},
  {"CupertinoIcons.news" : CupertinoIcons.news},
  {"CupertinoIcons.news_solid" : CupertinoIcons.news_solid},
];