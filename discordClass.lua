--[[
    A simple class that allows roblox developers to easily send messages to discord

    @author tomspell
    @author https://www.roblox.com/users/9345226/profile
    @version 1.0
    @version Last Updated: 6/20/2020
]]

local HttpService = game:GetService("HttpService")

local discordClass = {}
discordClass.__index = discordClass
discordClass.package = {
    username = "",
    content = "",
    embeds = {}
}

--[[
    Creates a discord message object

    @param webhook The webhook of the channel you want the message to be sent to

    @return The created message object
]]

function discordClass.new(webhook)
    assert(typeof(webhook) == "string", "webhook must be a string")

    local object = {}
    object.__index = object
    object.webhook = webhook

    setmetatable(object, discordClass)
    return object
end

--[[
    Creates a footer object that is used for the :AddEmbed function
    
    @param text The text you want on the footer
    @param icon_url? The optional icon_url of the footer
    @param proxy_icon_url? The optional proxy_icon_url of the footer

    @return The created footer object
]]

function discordClass.newFooter(text, icon_url, proxy_icon_url)
    assert(typeof(text) == "string", "text must be a string")
    return {
        text = text,
        icon_url = icon_url,
        proxy_icon_url = proxy_icon_url
    }
end

--[[
    -- NOTE: When creating field objects, they must be manually added to a table when they're used in the :AddEmbed function

    Creates a field object that is used for the :AddEmbed function
    
    @param name The name of the field
    @param value The description of the field
    @param inline? A boolean of if the field should be inline with the other fields, defaults to false

    @return The created field object
]]

function discordClass.newField(name, value, inline)
    assert(typeof(name) == "string", "name must be a string")
    assert(typeof(value) == "string", "value must be a string")
    if inline == nil then
        inline = false
    else
        assert(typeof(inline) == "boolean", "inline must be a boolean")
    end
    return {
        name = name,
        value = value,
        inline = inline
    }
end

--[[
    Creates a image object that is used for the :AddEmbed function
    
    @param url The image url you want on the embed
    @param proxy_icon_url? The optional proxy_icon_url of the image
    @param height? The optional height of the image
    @param width? The optional width of the image

    @return The created image object
]]


function discordClass.newImage(url, proxy_icon_url, height, width)
    assert(typeof(url) == "string", "url must be a string")
    if proxy_icon_url ~= nil then
        assert(typeof(proxy_icon_url) == "string", "proxy_icon_url must be a string")
    end
    if height ~= nil then
        assert(typeof(height) == "number", "height must be a number")
    end
    if width ~= nil then
        assert(typeof(width) == "number", "width must be a number")
    end
    return {
        url = url,
        proxy_icon_url = proxy_icon_url,
        height = height,
        width = width
    }
end

--[[
    -- NOTE: Thumbnail and image objects are the same, however keeping with discord documentation, we'll keep them separate, 
    as it'll be easier for less organized developers to remember which object they created was the image and which was the thumbnail.

    Creates a thumbnail object that is used for the :AddEmbed function
    
    @param url The thumbnail url you want on the embed
    @param proxy_icon_url? The optional proxy_icon_url of the thumbnail
    @param height? The optional height of the thumbnail
    @param width? The optional width of the thumbnail

    @return The created thumbnail object
]]


function discordClass.newThumbnail(url, proxy_icon_url, height, width)
    assert(typeof(url) == "string", "url must be a string")
    if proxy_icon_url ~= nil then
        assert(typeof(proxy_icon_url) == "string", "proxy_icon_url must be a string")
    end
    if height ~= nil then
        assert(typeof(height) == "number", "height must be a number")
    end
    if width ~= nil then
        assert(typeof(width) == "number", "width must be a number")
    end
    return {
        url = url,
        proxy_icon_url = proxy_icon_url,
        height = height,
        width = width
    }
end

--[[
    Sets the username of the webhook bot appearance

    @param username The username of the package. This can be left blank to default to the default name, or it can be overwritten with a custom name.
]]

function discordClass:SetUsername(username)
    assert(typeof(username) == "string", "message must be a string")
    self.package.username = username
end

--[[
    Sets the text message of the package

    @param message The core message of the package. Typically, if you're sending an embed, this is where you would @everyone or @here
]]

function discordClass:SetMessage(message)
    assert(typeof(message) == "string", "message must be a string")
    self.package.content = message
end

--[[
    Creates an embed and inserts it into the message

    @param title The title of the embed
    @param description The body text of embed
    @param color The color of the embed, given in a decimal color code -- You can get decimal color codes from https://convertingcolors.com/rgb-color-255_0_0.html
    @param fields? A table of fields, created with .newField
    @param footerObject? The footer object, created by .newFooter
    @param imageObject? The image object, created by .newImage
    @param thumbnailObject? The thumbnailObject object, created by .newThumbnail
]]

function discordClass:AddEmbed(title, description, color, fields, footerObject, imageObject, thumbnailObject)
    assert(typeof(title) == "string", "title must be a string")
    assert(typeof(description) == "string", "description must be a string")
    assert(typeof(color) == "number", "color must be a number")
    if fields ~= nil then
        assert(typeof(fields) == "table", "fields must be a table")
    end
    if footerObject ~= nil then
        assert(typeof(footerObject) == "table", "footerObject must be a table")
    end
    if imageObject ~= nil then
        assert(typeof(imageObject) == "table", "imageObject must be a table")
    end
    if thumbnailObject ~= nil then
        assert(typeof(thumbnailObject) == "table", "thumbnailObject must be a table")
    end
    local embed = {
        title = title,
        description = description,
        color = color,
        fields = fields,
        footer = footerObject,
        image = imageObject,
        thumbnail = thumbnailObject
    }
    table.insert(self.package.embeds, embed)
end

--[[
    Sends the message synchronously to discord and returns the response 
]]

function discordClass:Post()
    local response = HttpService:PostAsync(self.webhook, HttpService:JSONEncode(self.package))
    return response
end

--[[
    Sends the message asynchronously
]]

function discordClass:PostAsync()
    coroutine.wrap(function()
        HttpService:PostAsync(self.webhook, HttpService:JSONEncode(self.package))
    end)()
end

return discordClass