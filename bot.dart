// Import libraries.
import 'dart:io';
import 'dart:convert';
import 'package:yaml/yaml.dart';
import 'package:discord/discord.dart' as discord;

discord.Client bot;
Map<String, String> config;

// Where the code goes.
main() async {
  // Load the config and start the bot.
  try {
    config = JSON.decode(await new File('config.json').readAsString());
  } catch(err) {
    try {
      config = loadYaml(await new File('config.yaml').readAsString());
    } catch(err) {
      throw "config.json or config.yaml not found";
    }
  } finally {
    bot = new discord.Client(config['token']);
  }

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
