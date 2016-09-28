// Import libraries.
import 'dart:io';
import 'dart:convert';
import 'package:discord/discord.dart' as discord;

// Where the code goes.
main() async {
  // Load the config and start the bot.
  var config = JSON.decode(await new File('config.json').readAsString());
  var bot = new discord.Client(config['token']);

  // Print a message when the bot is ready.
  bot.on('ready', (e) {
    print("Bot online and ready!");
  });

  // Do stuff whenever the bot receives a message.
  bot.on('message', (e) {
    // Shortcut for e.message
    var m = e.message;

    // Log messages
    print("User: " + m.author.username + " Guild Name: " + m.guild.name + " Message: " + m.content);

    // Ping command.
    if (m.content.startsWith(config['prefix'] + "ping")) {
      m.channel.sendMessage("Pong!");
    }
  });
}
