local Hwids = {}

function Whitelist(Hwid)
    table.insert(Hwids,Hwid)
end
function Blacklist(Hwid)
    table.remove(Hwids, Hwids[Hwid])
end

Whitelist("bacf24f966692b02d4bf599de4cb5500b440f01c2d5d8aa2180fcf1b8e4c650b32a9aad53473f749dfc518501588a2629ce2c67f66c5a94b28ab2b4925600d78")

return Hwids
