escape_keyevent = hs.eventtap.new (
  {hs.eventtap.event.types.keyUp},
  function (event)
    local flags = event:getFlags()
    local keycode = hs.keycodes.map[event:getKeyCode()]

    if (keycode == 'escape') then
      local input_korean = "com.apple.inputmethod.Korean.2SetKorean"
      local input_english = "com.apple.keylayout.ABC"

      local input_source = hs.keycodes.currentSourceID()

      if (input_source ~= input_english) then
        hs.keycodes.currentSourceID(input_english)
        hs.eventtap.keyStroke({}, 'escape')
      end
    end
  end
)
escape_keyevent:start()

