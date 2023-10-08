StateMachine = {}
StateMachine.__index = StateMachine

function StateMachine:init(states)
    local this = {}
    setmetatable(this, StateMachine)
    
    this.empty = {
        render = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }
    this.states = states or {}
    this.current = this.empty
    
    return this
end

function StateMachine:change(stateName, enterParams)
    assert(self.states[stateName])
    self.current:exit()
    -- do check the next line when you create state classes
    self.current = self.states[stateName]:init()
    self.current:enter(enterParams)
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end
