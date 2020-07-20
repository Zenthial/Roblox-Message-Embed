<div align="center">
	<h1>Roblox LUA Discord Message Class</h1>
	<p>A way for developers to easily have discord integration into their games.</p>
</div>

## About

 A simple class that [Roblox](https://www.roblox.com) allows developers to easily send messages to discord. This class is fully documented with a JavaDoc style. The goal of this class is to allow for developers to send anywhere from the most simple of text messages to full rich embeds, using discord webhooks.

## Example
This example assumes that the class is a child of the server script.
```lua
local discordClass = require(script.DiscordClass)

local message = discordClass.new("https://discordapp.com/api/webhooks/696560287779782697/D5w9CxqUy03OgOoCIpMNpdSECz8JsfXe3jFmSyRx-pYE_RuxmRQHr4xYPJMl_WXmmrGU")

local newField = discordClass.newField("name", "value")
local newFooter = discordClass.newFooter("text goes here", "https://tr.rbxcdn.com/6a63f2b5da298c220feef4294755709c/150/150/AvatarHeadshot/Png")
local newImage = discordClass.newImage("https://tr.rbxcdn.com/6a63f2b5da298c220feef4294755709c/150/150/AvatarHeadshot/Png")
local newThumbnail = discordClass.newThumbnail("https://tr.rbxcdn.com/6a63f2b5da298c220feef4294755709c/150/150/AvatarHeadshot/Png")

message:AddEmbed("title", "description", 16711680, {newField}, newFooter, newImage, newThumbnail)

message:SetUsername("tomspell")
message:SetMessage("Test")
message:PostAsync()
```

## Credits
Version 1.0 was created by [tomspell](https://www.roblox.com/users/9345226/profile)

## License

MIT