
---
-- @field config
--
JMForgotTime = {
    config = {
        name = 'JMForgotTime',
        savedVariablesName = 'JMForgotTimeSavedVariables',
    },
}

---
--
function JMForgotTime:Initialize()
    self.savedVariables = ZO_SavedVars:NewAccountWide(
        self.config.savedVariablesName,
        1,
        self.config.name,
        {
            gui = {
                left = 0,
                top = 0,
            }
        }
    )
    self:restorePositions()

    JMForgotTimeIndicatorLabel:SetFont('EsoUI/Common/Fonts/univers55.otf|14|normal')
    JMForgotTime:updateTime()
end

---
--
function JMForgotTime:savePositions()
    self.savedVariables.gui.left = JMForgotTimeIndicator:GetLeft()
    self.savedVariables.gui.top = JMForgotTimeIndicator:GetTop()
end

---
--
function JMForgotTime:restorePositions()
    local left = self.savedVariables.gui.left
    local top = self.savedVariables.gui.top

    JMForgotTimeIndicator:ClearAnchors()
    JMForgotTimeIndicator:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, left, top)
end

---
--
function JMForgotTime:updateTime()
    JMForgotTimeIndicatorLabel:SetText(
        string.sub(GetTimeString(), 0, -4)
    )

    zo_callLater(function()
        JMForgotTime:updateTime()
    end, 10000)
end
