import 'dart:io';
import 'dart:convert';
import 'package:discord/discord.dart' as discord; //Do not change this.

main() async {
  var config = JSON.decode(await new File('config.json').readAsString());
  var bot = new discord.Client(config['token']);

  bot.on('ready', (e) { //e is telling the event.
    print("Bot online and ready!"); //Telling you that the bot is online and ready to use.
  });

  bot.on('message', (e) { //e is telling the event
    var m = e.message; //You can change the m to msg or message or whatever you like.
    //Don't do something big.
    print("User: " + m.author.username + " Guild Name: " + m.guild.name + " Message: " + m.content);
    //Logging system.

    if (m.content.startsWith(config['prefix'] + "ping")) {
      m.channel.sendMessage("Pong!");
    }
  });
}
