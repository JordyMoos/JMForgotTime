
--- Adding the initialize handler
EVENT_MANAGER:RegisterForEvent(
    JMForgotTime.config.name,
    EVENT_ADD_ON_LOADED,
    function (event, addonName)
        if addonName ~= JMForgotTime.config.name then
            return
        end

        JMForgotTime:Initialize()
        EVENT_MANAGER:UnregisterForEvent(JMForgotTime.config.name, EVENT_ADD_ON_LOADED)
    end
)
