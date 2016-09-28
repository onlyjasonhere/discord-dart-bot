import 'package:discord_dart/discord.dart' as discord; //Do not change this.

main() {
  var bot = new discord.Client("YOUR-BOT-TOKEN");
  var prefix = "YOUR-BOT-PREFIX"//Do not use ! please
  
  bot.on('ready', (e) { //e is telling the event.
    print("Bot online and ready!"); //Telling you that the bot is online and ready to use.
  });

  bot.on('message', (e) { //e is telling the event
    var m = e.message; //You can change the m to msg or message or whatever you like.
    //Don't do something big.
    print("User: " + m.author.username + " Guild Name: " + m.guild.name + " Message: " + m.content);
    //Logging system.
    
    if (m.content.startsWith((prefix + "ping") {
      m.channel.sendMessage("Pong!");
    }
  });
}
