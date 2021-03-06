local LoginScene = class("LoginScene", function()
    return display.newScene("LoginScene")
end)

function LoginScene:ctor()
    self.m_edtAccount = nil
    self.m_edtPwd = nil
    self:init()
end

function LoginScene:init()
--#if (CC_TARGET_PLATFORM==CC_PLATFORM_ANDROID)
--	this->setKeypadEnabled(true);
--#endif
    

    local layerColor = cc.LayerColor:create(cc.c4f(200, 200, 200, 200), display.width, display.height)
    self:addChild(layerColor)

    local account = "请输入您的账号"
    local pwd = "请输入您的密码"
    
    local szEditBox = cc.size(360, 50)
    local ptEditBox = cc.pAdd(cc.p(display.cx, display.cy), cc.p(0, 100))
    
    local editBox = cc.ui.UIInput.new({
        image = "EditBoxBg.png",
        size = szEditBox,
        x = ptEditBox.x,
        y = ptEditBox.y,
        listener = function(event, editbox)
            if event == "began" then
                self:onEditBoxBegan(editbox)
            elseif event == "ended" then
                self:onEditBoxEnded(editbox)
            elseif event == "return" then
                self:onEditBoxReturn(editbox)
            elseif event == "changed" then
                self:onEditBoxChanged(editbox)
            else
                printf("EditBox event %s", tostring(event))
            end
        end
    })
    editBox:setPlaceHolder(account)
    editBox:setPlaceholderFontColor(cc.c3b(0, 0, 0))
    editBox:setMaxLength(12)
    editBox:setInputMode(cc.EDITBOX_INPUT_MODE_ANY)
    editBox:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)
    self:addChild(editBox)
    self.m_edtAccount = editBox
    
    ptEditBox = cc.pAdd(cc.p(display.cx, display.cy), cc.p(0, 30))

    editBox = cc.ui.UIInput.new({
        image = "EditBoxBg.png",
        size = szEditBox,
        x = ptEditBox.x,
        y = ptEditBox.y,
        listener = function(event, editbox)
            if event == "began" then
                self:onEditBoxBegan(editbox)
            elseif event == "ended" then
                self:onEditBoxEnded(editbox)
            elseif event == "return" then
                self:onEditBoxReturn(editbox)
            elseif event == "changed" then
                self:onEditBoxChanged(editbox)
            else
                printf("EditBox event %s", tostring(event))
            end
        end
    })
    editBox:setPlaceHolder(pwd)
    editBox:setPlaceholderFontColor(cc.c3b(0, 0, 0))
    editBox:setMaxLength(12)
    editBox:setInputMode(cc.EDITBOX_INPUT_MODE_ANY)
    editBox:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)
    editBox:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)
    self:addChild(editBox)
    self.m_edtPwd = editBox
    
    local accountBg = cc.LayerColor:create(cc.c4f(100, 100, 200, 200), szEditBox.width, szEditBox.height)
    accountBg:setPosition(cc.pSub(cc.p(self.m_edtAccount:getPosition()), cc.p(self.m_edtAccount:getContentSize().width/2, self.m_edtAccount:getContentSize().height/2)))
    self:addChild(accountBg, -1)
    
    local cipherBg = cc.LayerColor:create(cc.c4f(100, 100, 200, 200), szEditBox.width, szEditBox.height)
    cipherBg:setPosition(cc.pSub(cc.p(self.m_edtPwd:getPosition()), cc.p(self.m_edtPwd:getContentSize().width/2, self.m_edtPwd:getContentSize().height/2)))
    self:addChild(cipherBg, -1)

    local PUSH_BUTTON_IMAGES = {
        normal = nil,
        pressed = nil,
        disabled = nil,
    }
    
    local btnLogin = cc.ui.UIPushButton.new(PUSH_BUTTON_IMAGES, {scale9 = true})
    btnLogin:setAnchorPoint(0.5, 0.5)
    btnLogin:setPosition(cc.pSub(cc.p(display.cx, display.cy), cc.p(80, 60)))
    btnLogin:setButtonLabel("normal", cc.ui.UILabel.new({
        UILabelType = 2,
        fontName = "Arial",
        text = "登陆",
        size = 50
    }))
    btnLogin:onButtonClicked(handler(self, self.onBtn_Login))
    self:addChild(btnLogin)
    
    local btnReg = cc.ui.UIPushButton.new(PUSH_BUTTON_IMAGES, {scale9 = true})
    btnReg:setAnchorPoint(0.5, 0.5)
    btnReg:setPosition(cc.pSub(cc.p(display.cx, display.cy), cc.p(-80, 60)))
    btnReg:setButtonLabel("normal", cc.ui.UILabel.new({
        UILabelType = 2,
        fontName = "Arial",
        text = "注册",
        size = 50
    }))
    btnReg:onButtonClicked(handler(self, self.onBtn_Register))
    self:addChild(btnReg)
        
    return true
end

-- 登陆按钮
function LoginScene:onBtn_Login(event)
    self:joinGame()
end

-- 注册按钮
function LoginScene:onBtn_Register(event)
    for i = 0, 7 do
        local angle = i * 45 * math.pi / 180
    end
end

function LoginScene:joinGame()
    app:enterScene("RoleSelScene")
end

function LoginScene:onEditBoxBegan(editbox)
    printf("editBox1 event began : text = %s", editbox:getText())
end

function LoginScene:onEditBoxEnded(editbox)
    printf("editBox1 event ended : %s", editbox:getText())
end

function LoginScene:onEditBoxReturn(editbox)
    printf("editBox1 event return : %s", editbox:getText())
end

function LoginScene:onEditBoxChanged(editbox)
    printf("editBox1 event changed : %s", editbox:getText())
end


function LoginScene:keyBackClicked()
    
end

function LoginScene:keyMenuClicked()

end

return LoginScene