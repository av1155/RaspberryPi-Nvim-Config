return {
    concurrency = 8,
    ui = {
        border = "rounded",
        size = {
            width = 0.8,
            height = 0.8,
        },
    },
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        concurrency = 8, ---@type number? set to 1 to check for updates very slowly
        notify = true, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
    },
}
