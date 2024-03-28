-- Free Script by godkudbl
-- Made by godkudbl

::menu::
menu = gg.choice({
  'Make a unit 14 stars',
  'Change FOV',
  'Exit'
}, nil, '𝐟𝐫𝐞𝐞 𝐬𝐜𝐫𝐢𝐩𝐭 𝐛𝐲 𝐠𝐨𝐝𝐤𝐮 𝐝𝐛𝐥\nMade by godkudbl')

if menu == 1 then
  -- Make a unit 14 stars
  gg.alert('Please enter the ID for the unit:')
  gg.prompt({'Enter ID:'}, nil, {number = {}})
  local results = gg.getResult()
  local id = results[1]
  gg.searchNumber('14', gg.TYPE_DWORD)
  gg.refineNumber('14', gg.TYPE_DWORD)
  local units = gg.getResultsCount()
  gg.alert('Found ' .. units .. ' units.')
  gg.sleep(1000)
  gg.toast('Making unit 14 stars...')
  gg.setValues({
    {address = gg.getResults()[1].address + 4, value = id},
    {address = gg.getResults()[2].address, value = 9999}
  })
  gg.clearResults()
elseif menu == 2 then
  -- Change FOV
  gg.alert('Please enter the new FOV:')
  gg.prompt({'Enter FOV (360):'}, nil, {number = {}})
  local results = gg.getResult()
  local fov = results[1]
  gg.searchNumber('360', gg.TYPE_FLOAT)
  gg.refineNumber('360', gg.TYPE_FLOAT)
  local fovs = gg.getResultsCount()
  gg.alert('Found ' .. fovs .. ' FOV values.')
  gg.sleep(1000)
  gg.toast('Changing FOV...')
  local fovAddresses = gg.getResults()
  for i = 1, #fovAddresses do
    gg.setValues({{address = fovAddresses[i].address, value = fov}})
  end
  gg.clearResults()
elseif menu == 3 then
  os.exit()
end
goto menu
