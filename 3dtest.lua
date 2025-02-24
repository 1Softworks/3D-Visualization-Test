print("Starting Advanced 3D Visualization & Effects Test")
print("=============================================")

local totalTests = 0
local passedTests = 0

local function runTest(name, testFunc)
    totalTests = totalTests + 1
    print("Running test: " .. name)
    local success, result = pcall(testFunc)
    if success and result then
        passedTests = passedTests + 1
        print("✅ " .. name .. " passed!")
    else
        print("❌ " .. name .. " failed!")
    end
end

runTest("3D Box ESP", function()
    local drawings = {}
    for i = 1, 20 do
        local box = Drawing.new("CubeHandleAdornment")
        box.Visible = true
        box.Size = Vector3.new(5, 5, 5)
        box.CFrame = CFrame.new(i * 10, 10, i * 10)
        box.Color3 = Color3.fromHSV(i/20, 1, 1)
        box.Transparency = 0.5
        table.insert(drawings, box)
    end
    task.wait(1)
    for _, drawing in ipairs(drawings) do
        drawing:Remove()
    end
    return true
end)

runTest("Advanced Particle System", function()
    local emitter = Instance.new("ParticleEmitter")
    emitter.Rate = 100
    emitter.Speed = NumberRange.new(20, 40)
    emitter.Lifetime = NumberRange.new(1, 3)
    emitter.SpreadAngle = Vector2.new(0, 360)
    emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})
    emitter.Acceleration = Vector3.new(0, 10, 0)
    emitter.Drag = 5
    emitter.RotSpeed = NumberRange.new(-360, 360)
    task.wait(2)
    emitter:Destroy()
    return true
end)

runTest("3D Line Tracer", function()
    local lines = {}
    local points = {}
    for i = 0, 720, 5 do
        local rad = math.rad(i)
        local point = Vector3.new(math.cos(rad) * 20, i/10, math.sin(rad) * 20)
        table.insert(points, point)
    end
    for i = 1, #points-1 do
        local line = Drawing.new("Line")
        line.Visible = true
        line.From = points[i]
        line.To = points[i+1]
        line.Color = Color3.fromHSV(i/#points, 1, 1)
        line.Thickness = 2
        table.insert(lines, line)
    end
    task.wait(1)
    for _, line in ipairs(lines) do
        line:Remove()
    end
    return true
end)

runTest("Dynamic 3D Text", function()
    local texts = {}
    for i = 1, 15 do
        local text = Drawing.new("Text")
        text.Visible = true
        text.Position = Vector2.new(200 + i * 30, 200 + i * 30)
        text.Size = 20
        text.Center = true
        text.Text = "3D Text " .. i
        text.Color = Color3.fromHSV(i/15, 1, 1)
        text.OutlineColor = Color3.new(0, 0, 0)
        text.Outline = true
        table.insert(texts, text)
    end
    task.wait(1)
    for _, text in ipairs(texts) do
        text:Remove()
    end
    return true
end)

runTest("3D Sphere Visualization", function()
    local spheres = {}
    for i = 1, 15 do
        local sphere = Drawing.new("SphereHandleAdornment")
        sphere.Visible = true
        sphere.Radius = i
        sphere.CFrame = CFrame.new(i * 8, 20, i * 8)
        sphere.Color3 = Color3.fromHSV(i/15, 1, 1)
        sphere.Transparency = 0.3
        table.insert(spheres, sphere)
    end
    task.wait(1)
    for _, sphere in ipairs(spheres) do
        sphere:Remove()
    end
    return true
end)

runTest("3D Cylinder Test", function()
    local cylinders = {}
    for i = 1, 12 do
        local cylinder = Drawing.new("CylinderHandleAdornment")
        cylinder.Visible = true
        cylinder.Height = i * 5
        cylinder.Radius = 2
        cylinder.CFrame = CFrame.new(i * 10, i * 5, i * 10)
        cylinder.Color3 = Color3.fromHSV(i/12, 1, 1)
        cylinder.Transparency = 0.4
        table.insert(cylinders, cylinder)
    end
    task.wait(1)
    for _, cylinder in ipairs(cylinders) do
        cylinder:Remove()
    end
    return true
end)

runTest("3D Cone Visualization", function()
    local cones = {}
    for i = 1, 10 do
        local cone = Drawing.new("ConeHandleAdornment")
        cone.Visible = true
        cone.Height = i * 4
        cone.Radius = i
        cone.CFrame = CFrame.new(i * 12, 30, i * 12)
        cone.Color3 = Color3.fromHSV(i/10, 1, 1)
        cone.Transparency = 0.5
        table.insert(cones, cone)
    end
    task.wait(1)
    for _, cone in ipairs(cones) do
        cone:Remove()
    end
    return true
end)

runTest("3D Wireframe Mesh", function()
    local lines = {}
    for x = -5, 5 do
        for z = -5, 5 do
            local line = Drawing.new("Line")
            line.Visible = true
            line.From = Vector3.new(x * 5, math.sin(x) * 5, z * 5)
            line.To = Vector3.new(x * 5, math.cos(z) * 5, z * 5)
            line.Color = Color3.fromHSV((x+5)/10, 1, 1)
            line.Thickness = 1
            table.insert(lines, line)
        end
    end
    task.wait(1)
    for _, line in ipairs(lines) do
        line:Remove()
    end
    return true
end)

runTest("Dynamic Light Sources", function()
    local lights = {}
    for i = 1, 8 do
        local light = Instance.new("PointLight")
        light.Range = i * 10
        light.Brightness = i
        light.Color = Color3.fromHSV(i/8, 1, 1)
        table.insert(lights, light)
    end
    task.wait(1)
    for _, light in ipairs(lights) do
        light:Destroy()
    end
    return true
end)

runTest("3D Trail Effect", function()
    local trails = {}
    for i = 1, 10 do
        local trail = Instance.new("Trail")
        trail.Lifetime = 1
        trail.MinLength = 0.1
        trail.MaxLength = 5
        trail.Color = ColorSequence.new(Color3.fromHSV(i/10, 1, 1))
        trail.Transparency = NumberSequence.new(0, 1)
        trail.WidthScale = NumberSequence.new(1, 0)
        table.insert(trails, trail)
    end
    task.wait(1)
    for _, trail in ipairs(trails) do
        trail:Destroy()
    end
    return true
end)

print("=============================================")
print("🎨 Advanced 3D Visualization Test Completed! 🎨")
print("📊 Final Score: " .. passedTests .. "/" .. totalTests .. " tests passed (" .. math.floor((passedTests/totalTests)*100) .. "%)")
if passedTests == totalTests then
    print("🌟 Perfect! All visualization features working! 🌟")
else
    print("⚠️ Some visualization features may be limited ⚠️")
end

