require 'discordrb'
require 'discordrb/webhooks'
require 'configatron'
require 'colorize'




bot = Discordrb::Commands::CommandBot.new token: 'TOKEN', prefix: 'PRFIX'
configatron.userid = ID

bot.ready do |event|
  puts "Logged in as #{bot.profile.username} (ID:#{bot.profile.id}) | #{bot.servers.size} servers".green
  bot.game = 'Statut'
end



#IMPORTANT






#HELP COMMANDS

bot.command(:help) do |event|
  servers = event.bot.servers
  event.channel.send_embed do |embed|
      embed.colour = 0x00ED00 
      embed.title = ' __**HELP COMMANDS**__ '
      
      
      embed.add_field name: " __**B64**__ ", value: "``[b64encode] [b64decode] ``", inline: false

   
      embed.add_field name: " __**Other**__ ", value: "``[about]``", inline: false

      

      embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://i.pinimg.com/originals/96/4b/19/964b19868442830a3deed095b3683483.gif')
      
    
  end
end






#b64 encode COMMANDS
bot.command(:b64encode) do |event, *args|
  output = ""
  begin
      output += "```" + Base64.encode64(*args.join(" ")) + "```"
  rescue => e
      output += "Quelque chose s'est mal passé ici. #{e.to_s}"
  else
      if output.length >= 1998
          output = output[0..1985]
          output += "(truncated)"
      else
          return output
      end
  end
end


#b64 decode COMMANDS
bot.command(:b64decode) do |event, base64_text|
  output = ""
  begin
      output += "```" + Base64.decode64(base64_text) + "```"
  rescue => e
      output += "Something went wrong here. #{e.to_s}"
  else
      if output.length >= 1998
          output = output[0..1985]
          output += "(truncated)"
      else
          return output
      end
  end
end




#ABOUT COMMANDS
bot.command(:about) do |event|
  servers = event.bot.servers
  event.channel.send_embed do |embed|
      embed.colour = 0x00ED00
      embed.title = 'About | RubyBOT'
      embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: 'https://cdn.discordapp.com/attachments/670678064564404230/708295120835051591/Ruby_logo.svg.png')
      embed.add_field name: " \sCreator", value: "$Rayan [Overdrive]#0617", inline: true
      embed.add_field name: " \sLibrary", value: "discordrb", inline: true
      embed.add_field name: " \sLanguage", value: "Rb", inline: true
      embed.image = Discordrb::Webhooks::EmbedImage.new(url: 'https://cdn.discordapp.com/attachments/670678064564404230/714244262065209374/2pac.gif')
     
      
  end
end










puts "
██████   ██████  ██   ██     ██████   ██████  ████████     ██████  ██ ███████  ██████  ██████  ██████  ██████  
██   ██ ██       ██   ██     ██   ██ ██    ██    ██        ██   ██ ██ ██      ██      ██    ██ ██   ██ ██   ██ 
██████  ███████  ███████     ██████  ██    ██    ██        ██   ██ ██ ███████ ██      ██    ██ ██████  ██   ██ 
██   ██ ██    ██      ██     ██   ██ ██    ██    ██        ██   ██ ██      ██ ██      ██    ██ ██   ██ ██   ██ 
██████   ██████       ██     ██████   ██████     ██        ██████  ██ ███████  ██████  ██████  ██   ██ ██████  
                                                                                                 - By $Rayan
                                                                                                                                                 
                                                                                                                                                  
".red








bot.run