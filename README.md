<div align="center">
	<h1>Roblox Message Embed</h1>
	<p>A way for developers to easily have discord integration into their games.</p>
</div>

## About

 A simple class that [Roblox](https://www.roblox.com) allows developers to easily send messages to discord. This class is fully documented with a JavaDoc style. The goal of this class is to allow for developers that are used to using [discord.js](https://discord.js.org/#/) style of embeds to easily create embeds and integrate discord into their games. If you'd like to pick up the roblox model, you can do so [here](https://www.roblox.com/library/5390222472/MessageEmbed)

## Example
This example assumes that the class is a child of the server script. This example shows the usage of every method within the class.
```lua
local MessageEmbed = require(script.MessageEmbed)

local fieldsToAdd = {
	{"testing", "other testing"},
	{"more testing", "even more testing"}
}

local embed = MessageEmbed.new("https://discordapp.com/api/webhooks/556545042198560798/Kjk3NvUGZgyWvq4vNoKg5xKgKp1K2YiQEV4uj8fvScbZVkxzO8VnpyYYiqFNU_Feqy3a")
embed:SetTitle("Test")
embed:SetDescription("more test")
embed:AddField("testing", "other testing")
embed:AddFields(fieldsToAdd)
embed:SetColor(16770680)
embed:SetFooter("created by tomspell", "https://tr.rbxcdn.com/6a63f2b5da298c220feef4294755709c/150/150/AvatarHeadshot/Png")
embed:SetImage("https://tr.rbxcdn.com/6a63f2b5da298c220feef4294755709c/150/150/AvatarHeadshot/Png")
embed:SetThumbnail("https://tr.rbxcdn.com/6a63f2b5da298c220feef4294755709c/150/150/AvatarHeadshot/Png")
embed:SetUrl("https://www.roblox.com/users/9345226/profile")

embed:PostAsync()
```

## Credits
Version 1.0 was created by [tomspell](https://www.roblox.com/users/9345226/profile)

Inspired by [discord.js Message Embeds](https://discord.js.org/#/docs/main/stable/class/MessageEmbed)

## License

MIT