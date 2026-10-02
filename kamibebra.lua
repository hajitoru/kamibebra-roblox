-- KAMIBEBRA v1.8
local CG,P,UIS,RS=game:GetService("CoreGui"),game:GetService("Players"),game:GetService("UserInputService"),game:GetService("RunService")
local LP=P.LocalPlayer
local BG=Color3.fromRGB(18,18,20)
local PN=Color3.fromRGB(26,26,28)
local PN2=Color3.fromRGB(36,36,38)
local AC=Color3.fromRGB(190,75,255)
local AC2=Color3.fromRGB(210,130,255)
local TX=Color3.fromRGB(240,240,240)
local TXD=Color3.fromRGB(140,140,140)
local BD=Color3.fromRGB(45,45,45)
local BK=Color3.fromRGB(8,8,8)
local CHPS,CHJB,CHEB,CHAI=AC,TX,AC,AC2
local SC=AC
pcall(function() for _,o in ipairs(CG:GetChildren()) do if o.Name=="KAMIBEBRA" then o:Destroy() end end end)
local SG=Instance.new("ScreenGui")
SG.Name="KAMIBEBRA"; SG.ResetOnSpawn=false; SG.IgnoreGuiInset=true
local ok=pcall(function() SG.Parent=CG end)
if not ok or not SG.Parent then SG.Parent=LP:WaitForChild("PlayerGui") end

-- WATERMARK
local WML=false
local WM=Instance.new("Frame",SG)
WM.Size=UDim2.new(0,420,0,28); WM.Position=UDim2.new(0.5,-210,0,8)
WM.BackgroundColor3=BG; WM.BackgroundTransparency=0.15; WM.BorderSizePixel=0; WM.ZIndex=30
Instance.new("UICorner",WM).CornerRadius=UDim.new(0,6)
local WMS=Instance.new("UIStroke",WM); WMS.Color=AC; WMS.Thickness=1.5
local WMSca=Instance.new("UIScale",WM)
local WB=Instance.new("TextLabel",WM)
WB.Size=UDim2.new(0,130,1,0); WB.Position=UDim2.new(0,12,0,0); WB.BackgroundTransparency=1
WB.Text="kamibebra"; WB.TextColor3=AC; WB.Font=Enum.Font.GothamBold; WB.TextSize=14
WB.TextXAlignment=Enum.TextXAlignment.Left; WB.ZIndex=31
local WD=Instance.new("Frame",WM)
WD.Size=UDim2.new(0,1,0,16); WD.Position=UDim2.new(0,140,0.5,-8); WD.BackgroundColor3=BD; WD.BorderSizePixel=0; WD.ZIndex=31
local WI=Instance.new("TextLabel",WM)
WI.Size=UDim2.new(1,-155,1,0); WI.Position=UDim2.new(0,150,0,0); WI.BackgroundTransparency=1
WI.Text=""; WI.TextColor3=TX; WI.Font=Enum.Font.GothamMedium; WI.TextSize=13
WI.TextXAlignment=Enum.TextXAlignment.Right; WI.ZIndex=31
local wa=0
RS.Heartbeat:Connect(function(dt)
 wa=wa+dt; if wa<0.2 then return end; wa=0
 if not WM.Visible then return end
 local fps=math.floor(1/math.max(dt,0.0001))
 local ping=0
 pcall(function() ping=math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) end)
 local t=os.date("*t")
 WI.Text=LP.Name.."  |  FPS: "..fps.."  |  "..ping.."ms  |  "..string.format("%02d:%02d:%02d",t.hour,t.min,t.sec)
end)
local wd,ws,wp=false,nil,nil
WM.InputBegan:Connect(function(i)
 if WML then return end
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  wd=true; ws=i.Position; wp=WM.Position; WMS.Color=AC2; WMS.Thickness=2
 end
end)
UIS.InputChanged:Connect(function(i)
 if not wd then return end
 if i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch then
  local d=i.Position-ws
  WM.Position=UDim2.new(wp.X.Scale,wp.X.Offset+d.X,wp.Y.Scale,wp.Y.Offset+d.Y)
 end
end)
UIS.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  wd=false; WMS.Color=AC; WMS.Thickness=1.5
 end
end)

-- HUD
local HudOn,ShSp,ShPS,ShJB,ShAir,ShEB=true,true,true,true,true,true
local HudL=false
local HBX,HBY,HOX,HOY=-100,-120,0,0
local HS=Instance.new("TextLabel",SG)
HS.Size=UDim2.new(0,200,0,40); HS.BackgroundTransparency=1; HS.Text="0"
HS.TextColor3=TX; HS.Font=Enum.Font.GothamBold; HS.TextSize=32
HS.TextStrokeTransparency=0.4; HS.TextStrokeColor3=BK; HS.TextXAlignment=Enum.TextXAlignment.Center; HS.ZIndex=5
local function cl(l)
 local c=l:Clone(); c.Visible=false; c.Parent=SG; return c
end
local HP=cl(HS); HP.Size=UDim2.new(0,200,0,20); HP.Text="ps"; HP.TextSize=18
local HJ=cl(HS); HJ.Size=UDim2.new(0,200,0,20); HJ.Text="jb"; HJ.TextSize=18
local HE=cl(HS); HE.Size=UDim2.new(0,200,0,20); HE.Text="eb"; HE.TextSize=18
local HA=cl(HS); HA.Size=UDim2.new(0,200,0,20); HA.Text="airstuck"; HA.TextSize=14
local function uHP()
 local bx=HBX+HOX; local by=HBY+HOY
 HS.Position=UDim2.new(0.5,bx,1,by)
 HP.Position=UDim2.new(0.5,bx,1,by+36)
 HJ.Position=UDim2.new(0.5,bx,1,by+56)
 HE.Position=UDim2.new(0.5,bx,1,by+76)
 HA.Position=UDim2.new(0.5,bx,1,by+96)
end
uHP()
local hdg,hx,hy,hox,hoy=false,0,0,0,0
local function ahd(l)
 l.InputBegan:Connect(function(i)
  if HudL then return end
  if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
   hdg=true; hx=i.Position.X; hy=i.Position.Y; hox=HOX; hoy=HOY
  end
 end)
end
ahd(HS); ahd(HP); ahd(HJ); ahd(HE); ahd(HA)
UIS.InputChanged:Connect(function(i)
 if not hdg then return end
 if i.UserInputType~=Enum.UserInputType.MouseMovement and i.UserInputType~=Enum.UserInputType.Touch then return end
 HOX=hox+(i.Position.X-hx); HOY=hoy+(i.Position.Y-hy); uHP()
end)
UIS.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then hdg=false end
end)

-- BTN
local function mkBtn(t,y)
 local b=Instance.new("TextButton",SG)
 b.Size=UDim2.new(0,80,0,80); b.Position=UDim2.new(1,-110,0.5,y)
 b.BackgroundColor3=BK; b.BackgroundTransparency=0.2; b.Text=t; b.TextColor3=AC
 b.Font=Enum.Font.GothamBold; b.TextSize=24; b.TextStrokeTransparency=0; b.TextStrokeColor3=BK
 b.AutoButtonColor=false; b.ZIndex=10; b.Visible=false
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
 local s=Instance.new("UIStroke",b); s.Color=AC; s.Thickness=1.5
 return b
end
local PSB=mkBtn("PS",-40)
local JBB=mkBtn("JB",60)
local ASB=mkBtn("AS",160)
local PSL,JBL,ASL=false,false,false
local ASOn,ASEn=false,false
local function disAS()
 ASOn=false; ASB.TextColor3=AC
 if _G.KAMIBEBRA_airBV then pcall(function() _G.KAMIBEBRA_airBV:Destroy() end); _G.KAMIBEBRA_airBV=nil end
 local ch=LP.Character; if not ch then return end
 local hm=ch:FindFirstChildOfClass("Humanoid"); local hp=ch:FindFirstChild("HumanoidRootPart")
 if not hm then return end
 hm.PlatformStand=false
 if hp then hp.CFrame=CFrame.new(hp.Position+Vector3.new(0,3,0)); hp.Velocity=Vector3.new(0,10,0) end
 hm:ChangeState(Enum.HumanoidStateType.Freefall)
end
local psh,psm,pss,psb=false,false,nil,nil
PSB.InputBegan:Connect(function(i)
 if i.UserInputType~=Enum.UserInputType.MouseButton1 and i.UserInputType~=Enum.UserInputType.Touch then return end
 psh=true; psm=false; pss=i.Position; psb=PSB.Position
end)
UIS.InputChanged:Connect(function(i)
 if not psh then return end
 if i.UserInputType~=Enum.UserInputType.MouseMovement and i.UserInputType~=Enum.UserInputType.Touch then return end
 local d=i.Position-pss
 if math.abs(d.X)>8 or math.abs(d.Y)>8 then psm=true end
 if psm and not PSL then PSB.Position=UDim2.new(psb.X.Scale,psb.X.Offset+d.X,psb.Y.Scale,psb.Y.Offset+d.Y) end
end)
PSB.InputEnded:Connect(function(i)
 if i.UserInputType~=Enum.UserInputType.MouseButton1 and i.UserInputType~=Enum.UserInputType.Touch then return end
 psh=false
end)
local jh,jm,js,jb=false,false,nil,nil
JBB.InputBegan:Connect(function(i)
 if i.UserInputType~=Enum.UserInputType.MouseButton1 and i.UserInputType~=Enum.UserInputType.Touch then return end
 jh=true; jm=false; js=i.Position; jb=JBB.Position; JBB.BackgroundTransparency=0
end)
UIS.InputChanged:Connect(function(i)
 if not jh then return end
 if i.UserInputType~=Enum.UserInputType.MouseMovement and i.UserInputType~=Enum.UserInputType.Touch then return end
 local d=i.Position-js
 if math.abs(d.X)>8 or math.abs(d.Y)>8 then jm=true end
 if jm and not JBL then JBB.Position=UDim2.new(jb.X.Scale,jb.X.Offset+d.X,jb.Y.Scale,jb.Y.Offset+d.Y) end
end)
JBB.InputEnded:Connect(function(i)
 if i.UserInputType~=Enum.UserInputType.MouseButton1 and i.UserInputType~=Enum.UserInputType.Touch then return end
 jh=false; JBB.BackgroundTransparency=0.2
end)
local ad,am,as,ab=false,false,nil,nil
ASB.InputBegan:Connect(function(i)
 if i.UserInputType~=Enum.UserInputType.MouseButton1 and i.UserInputType~=Enum.UserInputType.Touch then return end
 ad=true; am=false; as=i.Position; ab=ASB.Position; ASB.BackgroundTransparency=0
end)
UIS.InputChanged:Connect(function(i)
 if not ad then return end
 if i.UserInputType~=Enum.UserInputType.MouseMovement and i.UserInputType~=Enum.UserInputType.Touch then return end
 local d=i.Position-as
 if math.abs(d.X)>8 or math.abs(d.Y)>8 then am=true end
 if am and not ASL then ASB.Position=UDim2.new(ab.X.Scale,ab.X.Offset+d.X,ab.Y.Scale,ab.Y.Offset+d.Y) end
end)
ASB.InputEnded:Connect(function(i)
 if i.UserInputType~=Enum.UserInputType.MouseButton1 and i.UserInputType~=Enum.UserInputType.Touch then return end
 if ad then
  ad=false; ASB.BackgroundTransparency=0.2
  if not am then
   if ASOn then disAS() else ASOn=true; ASB.TextColor3=AC2 end
  end
 end
end)

-- MAIN
local M=Instance.new("Frame",SG)
M.Size=UDim2.new(0,550,0,380); M.Position=UDim2.new(0.5,-275,0.5,-190)
M.BackgroundColor3=BG; M.BackgroundTransparency=0.05; M.BorderSizePixel=0
Instance.new("UICorner",M).CornerRadius=UDim.new(0,6)
local MS=Instance.new("UIStroke",M); MS.Color=AC; MS.Thickness=1
local US=Instance.new("UIScale",M)
local TB=Instance.new("Frame",M)
TB.Size=UDim2.new(1,0,0,32); TB.BackgroundColor3=PN; TB.BorderSizePixel=0
local St=Instance.new("Frame",TB)
St.Size=UDim2.new(0,3,1,0); St.BackgroundColor3=AC; St.BorderSizePixel=0
local Ti=Instance.new("TextLabel",TB)
Ti.Size=UDim2.new(1,-60,1,0); Ti.Position=UDim2.new(0,12,0,0); Ti.BackgroundTransparency=1
Ti.Text="kamibebra"; Ti.TextColor3=AC; Ti.Font=Enum.Font.GothamBold; Ti.TextSize=14; Ti.TextXAlignment=Enum.TextXAlignment.Left
local CB=Instance.new("TextButton",TB)
CB.Size=UDim2.new(0,32,1,0); CB.Position=UDim2.new(1,-32,0,0)
CB.BackgroundColor3=PN; CB.BorderSizePixel=0; CB.Text="X"
CB.TextColor3=TXD; CB.Font=Enum.Font.GothamBold; CB.TextSize=14; CB.AutoButtonColor=false
local SB=Instance.new("Frame",M)
SB.Size=UDim2.new(0,140,1,-46); SB.Position=UDim2.new(0,6,0,38)
SB.BackgroundColor3=PN; SB.BorderSizePixel=0
Instance.new("UICorner",SB).CornerRadius=UDim.new(0,4)
local TL=Instance.new("Frame",SB)
TL.Size=UDim2.new(1,0,1,0); TL.BackgroundTransparency=1
local TLL=Instance.new("UIListLayout",TL); TLL.Padding=UDim.new(0,4); TLL.SortOrder=Enum.SortOrder.LayoutOrder
local TPP=Instance.new("UIPadding",TL)
TPP.PaddingTop=UDim.new(0,8); TPP.PaddingLeft=UDim.new(0,6); TPP.PaddingRight=UDim.new(0,6)
local CN=Instance.new("Frame",M)
CN.Size=UDim2.new(1,-156,1,-46); CN.Position=UDim2.new(0,150,0,38)
CN.BackgroundColor3=PN; CN.BorderSizePixel=0
Instance.new("UICorner",CN).CornerRadius=UDim.new(0,4)
local Tg=Instance.new("TextButton",SG)
Tg.Size=UDim2.new(0,50,0,50); Tg.Position=UDim2.new(0,20,0.5,-25)
Tg.BackgroundColor3=BK; Tg.Text="K"; Tg.TextColor3=AC
Tg.Font=Enum.Font.GothamBold; Tg.TextSize=20; Tg.AutoButtonColor=false; Tg.ZIndex=10
Instance.new("UICorner",Tg).CornerRadius=UDim.new(1,0)
local TGS=Instance.new("UIStroke",Tg); TGS.Color=AC; TGS.Thickness=2
local td,ts,tp,tm=false,nil,nil,false
Tg.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  td=true; tm=false; ts=i.Position; tp=Tg.Position
 end
end)
UIS.InputChanged:Connect(function(i)
 if td and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-ts
  if math.abs(d.X)>6 or math.abs(d.Y)>6 then tm=true end
  if tm then Tg.Position=UDim2.new(tp.X.Scale,tp.X.Offset+d.X,tp.Y.Scale,tp.Y.Offset+d.Y) end
 end
end)
UIS.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  if td then td=false; if not tm then M.Visible=not M.Visible end end
 end
end)
local dr,ds,dp=false,nil,nil
TB.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  dr=true; ds=i.Position; dp=M.Position
 end
end)
UIS.InputChanged:Connect(function(i)
 if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-ds
  M.Position=UDim2.new(dp.X.Scale,dp.X.Offset+d.X,dp.Y.Scale,dp.Y.Offset+d.Y)
 end
end)
UIS.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end
end)
CB.MouseButton1Click:Connect(function() M.Visible=false end)

local Tabs,AT,SL={},nil,false
local function mkTab(n)
 local b=Instance.new("TextButton",TL)
 b.Size=UDim2.new(1,0,0,32); b.BackgroundColor3=PN; b.BorderSizePixel=0
 b.Text="  "..n; b.TextColor3=TXD; b.Font=Enum.Font.GothamMedium; b.TextSize=13
 b.TextXAlignment=Enum.TextXAlignment.Left; b.AutoButtonColor=false
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
 local sr=Instance.new("Frame",b)
 sr.Size=UDim2.new(0,3,0,16); sr.Position=UDim2.new(0,0,0.5,-8)
 sr.BackgroundColor3=AC; sr.BorderSizePixel=0; sr.Visible=false
 Instance.new("UICorner",sr).CornerRadius=UDim.new(0,2)
 local p=Instance.new("ScrollingFrame",CN)
 p.Size=UDim2.new(1,-12,1,-12); p.Position=UDim2.new(0,6,0,6)
 p.BackgroundTransparency=1; p.Visible=false; p.BorderSizePixel=0
 p.ScrollBarThickness=8; p.ScrollBarImageColor3=AC; p.ScrollBarImageTransparency=0.2
 p.CanvasSize=UDim2.new(0,0,0,0); p.AutomaticCanvasSize=Enum.AutomaticSize.Y
 p.ScrollingDirection=Enum.ScrollingDirection.Y
 local L=Instance.new("UIListLayout",p); L.Padding=UDim.new(0,6); L.SortOrder=Enum.SortOrder.LayoutOrder
 local Pd=Instance.new("UIPadding",p); Pd.PaddingRight=UDim.new(0,14)
 local t={Button=b,Page=p,Name=n,Stripe=sr}
 table.insert(Tabs,t)
 b.MouseButton1Click:Connect(function()
  if AT==t then return end
  if AT then
   AT.Button.BackgroundColor3=PN; AT.Button.TextColor3=TXD
   AT.Stripe.Visible=false; AT.Page.Visible=false
  end
  b.BackgroundColor3=PN2; b.TextColor3=TX
  sr.Visible=true; p.Visible=true; AT=t
 end)
 return t
end
local function Lbl(p,t)
 local l=Instance.new("TextLabel",p)
 l.Size=UDim2.new(1,0,0,18); l.BackgroundTransparency=1
 l.Text="  "..t; l.TextColor3=TXD; l.Font=Enum.Font.Gotham
 l.TextSize=11; l.TextXAlignment=Enum.TextXAlignment.Left
end
local function Sec(p,t)
 local s=Instance.new("Frame",p)
 s.Size=UDim2.new(1,0,0,20); s.BackgroundTransparency=1
 local ln=Instance.new("Frame",s)
 ln.Size=UDim2.new(1,0,0,1); ln.Position=UDim2.new(0,0,0.5,0)
 ln.BackgroundColor3=BD; ln.BorderSizePixel=0
 local lb=Instance.new("TextLabel",s)
 lb.Size=UDim2.new(0,200,1,0); lb.BackgroundColor3=PN; lb.BorderSizePixel=0
 lb.Text=" "..string.upper(t).." "; lb.TextColor3=AC; lb.Font=Enum.Font.Code; lb.TextSize=11
 lb.TextXAlignment=Enum.TextXAlignment.Left
end
local function Tog(p,t,d,cb)
 local f=Instance.new("Frame",p)
 f.Size=UDim2.new(1,0,0,26); f.BackgroundTransparency=1
 local l=Instance.new("TextLabel",f)
 l.Size=UDim2.new(0.7,0,1,0); l.BackgroundTransparency=1
 l.Text="  "..t; l.TextColor3=TX; l.Font=Enum.Font.Gotham; l.TextSize=12
 l.TextXAlignment=Enum.TextXAlignment.Left
 local s=Instance.new("TextButton",f)
 s.Size=UDim2.new(0,18,0,18); s.Position=UDim2.new(1,-18,0.5,-9)
 s.BackgroundColor3=BK; s.BorderSizePixel=0; s.Text=d and "X" or ""
 s.TextColor3=AC; s.Font=Enum.Font.GothamBold; s.TextSize=12; s.AutoButtonColor=false
 Instance.new("UICorner",s).CornerRadius=UDim.new(0,4)
 local st=Instance.new("UIStroke",s); st.Color=BD; st.Thickness=1
 local v=d
 s.MouseButton1Click:Connect(function()
  v=not v; s.Text=v and "X" or ""
  st.Color=v and AC or BD; cb(v)
 end)
end
local function Sli(p,t,mn,mx,d,cb)
 local f=Instance.new("Frame",p)
 f.Size=UDim2.new(1,0,0,42); f.BackgroundTransparency=1
 local l=Instance.new("TextLabel",f)
 l.Size=UDim2.new(0.6,0,0,18); l.BackgroundTransparency=1
 l.Text="  "..t; l.TextColor3=TX; l.Font=Enum.Font.Gotham; l.TextSize=12
 l.TextXAlignment=Enum.TextXAlignment.Left
 local v=Instance.new("TextLabel",f)
 v.Size=UDim2.new(0.4,0,0,18); v.Position=UDim2.new(0.6,0,0,0)
 v.BackgroundTransparency=1; v.Text=tostring(d); v.TextColor3=AC
 v.Font=Enum.Font.Code; v.TextSize=12; v.TextXAlignment=Enum.TextXAlignment.Right
 local bg=Instance.new("Frame",f)
 bg.Size=UDim2.new(1,-12,0,6); bg.Position=UDim2.new(0,6,0,26)
 bg.BackgroundColor3=BK; bg.BorderSizePixel=0
 Instance.new("UICorner",bg).CornerRadius=UDim.new(1,0)
 local fi=Instance.new("Frame",bg)
 fi.Size=UDim2.new((d-mn)/(mx-mn),0,1,0); fi.BackgroundColor3=AC; fi.BorderSizePixel=0
 Instance.new("UICorner",fi).CornerRadius=UDim.new(1,0)
 local k=Instance.new("Frame",bg)
 k.Size=UDim2.new(0,12,0,12); k.Position=UDim2.new((d-mn)/(mx-mn),-6,0.5,-6)
 k.BackgroundColor3=TX; k.BorderSizePixel=0
 Instance.new("UICorner",k).CornerRadius=UDim.new(1,0)
 local dg=false
 local function up(i)
  local ps=math.clamp((i.Position.X-bg.AbsolutePosition.X)/bg.AbsoluteSize.X,0,1)
  local vv=math.floor(mn+(mx-mn)*ps)
  fi.Size=UDim2.new(ps,0,1,0); k.Position=UDim2.new(ps,-6,0.5,-6)
  v.Text=tostring(vv); cb(vv)
 end
 bg.InputBegan:Connect(function(i)
  if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=true; up(i) end
 end)
 UIS.InputChanged:Connect(function(i)
  if dg and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then up(i) end
 end)
 UIS.InputEnded:Connect(function(i)
  if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=false end
 end)
end
local function CP(p,t,dc,cb)
 local f=Instance.new("Frame",p)
 f.Size=UDim2.new(1,0,0,116); f.BackgroundTransparency=1
 local hl=Instance.new("TextLabel",f)
 hl.Size=UDim2.new(1,-60,0,20); hl.BackgroundTransparency=1
 hl.Text="  "..t; hl.TextColor3=TX; hl.Font=Enum.Font.Gotham; hl.TextSize=12
 hl.TextXAlignment=Enum.TextXAlignment.Left
 local pv=Instance.new("Frame",f)
 pv.Size=UDim2.new(0,42,0,16); pv.Position=UDim2.new(1,-48,0,2)
 pv.BackgroundColor3=dc; pv.BorderSizePixel=0
 Instance.new("UICorner",pv).CornerRadius=UDim.new(0,3)
 local pst=Instance.new("UIStroke",pv); pst.Color=BD; pst.Thickness=1
 local r=math.floor(dc.R*255+0.5)
 local g=math.floor(dc.G*255+0.5)
 local b=math.floor(dc.B*255+0.5)
 local function uc()
  local c=Color3.fromRGB(r,g,b); pv.BackgroundColor3=c; cb(c)
 end
 local nm={"R","G","B"}
 local ini={r,g,b}
 local rc={Color3.fromRGB(255,80,80),Color3.fromRGB(80,255,80),Color3.fromRGB(80,80,255)}
 for i=1,3 do
  local idx=i; local n=nm[idx]; local v0=ini[idx]; local c0=rc[idx]
  local sf=Instance.new("Frame",f)
  sf.Size=UDim2.new(1,0,0,30); sf.Position=UDim2.new(0,0,0,22+(idx-1)*31)
  sf.BackgroundTransparency=1
  local nl=Instance.new("TextLabel",sf)
  nl.Size=UDim2.new(0,16,0,20); nl.Position=UDim2.new(0,4,0,5)
  nl.BackgroundTransparency=1; nl.Text=n; nl.TextColor3=TXD
  nl.Font=Enum.Font.GothamBold; nl.TextSize=11
  local vl=Instance.new("TextLabel",sf)
  vl.Size=UDim2.new(0,32,0,20); vl.Position=UDim2.new(1,-36,0,5)
  vl.BackgroundTransparency=1; vl.Text=tostring(v0); vl.TextColor3=AC
  vl.Font=Enum.Font.Code; vl.TextSize=11; vl.TextXAlignment=Enum.TextXAlignment.Right
  local bg=Instance.new("Frame",sf)
  bg.Size=UDim2.new(1,-60,0,6); bg.Position=UDim2.new(0,22,0.5,-3)
  bg.BackgroundColor3=BK; bg.BorderSizePixel=0
  Instance.new("UICorner",bg).CornerRadius=UDim.new(1,0)
  local fi=Instance.new("Frame",bg)
  fi.Size=UDim2.new(v0/255,0,1,0); fi.BackgroundColor3=c0; fi.BorderSizePixel=0
  Instance.new("UICorner",fi).CornerRadius=UDim.new(1,0)
  local dg=false
  local function up(inp)
   local ps=math.clamp((inp.Position.X-bg.AbsolutePosition.X)/bg.AbsoluteSize.X,0,1)
   local vv=math.floor(ps*255+0.5)
   fi.Size=UDim2.new(ps,0,1,0); vl.Text=tostring(vv)
   if idx==1 then r=vv elseif idx==2 then g=vv else b=vv end
   uc()
  end
  bg.InputBegan:Connect(function(inp)
   if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dg=true; up(inp) end
  end)
  UIS.InputChanged:Connect(function(inp)
   if dg and (inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch) then up(inp) end
  end)
  UIS.InputEnded:Connect(function(inp)
   if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then dg=false end
  end)
 end
end
local function Btn(p,t,cb)
 local b=Instance.new("TextButton",p)
 b.Size=UDim2.new(1,0,0,28); b.BackgroundColor3=BK; b.BorderSizePixel=0
 b.Text=t; b.TextColor3=TX; b.Font=Enum.Font.GothamMedium; b.TextSize=12; b.AutoButtonColor=false
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
 local st=Instance.new("UIStroke",b); st.Color=BD; st.Thickness=1
 b.MouseButton1Click:Connect(cb)
end
local function FB(page,n,d,ot,bd)
 local h=Instance.new("Frame",page)
 h.Size=UDim2.new(1,0,0,28); h.BackgroundTransparency=1
 local nl=Instance.new("TextLabel",h)
 nl.Size=UDim2.new(1,-90,1,0); nl.BackgroundTransparency=1
 nl.Text="  "..n; nl.TextColor3=TX; nl.Font=Enum.Font.Gotham; nl.TextSize=12
 nl.TextXAlignment=Enum.TextXAlignment.Left
 local ar=Instance.new("TextButton",h)
 ar.Size=UDim2.new(0,22,0,18); ar.Position=UDim2.new(1,-66,0.5,-9)
 ar.BackgroundColor3=BK; ar.BorderSizePixel=0; ar.Text=">"; ar.TextColor3=AC
 ar.Font=Enum.Font.GothamBold; ar.TextSize=11; ar.AutoButtonColor=false
 Instance.new("UICorner",ar).CornerRadius=UDim.new(0,4)
 local s=Instance.new("TextButton",h)
 s.Size=UDim2.new(0,18,0,18); s.Position=UDim2.new(1,-18,0.5,-9)
 s.BackgroundColor3=BK; s.BorderSizePixel=0; s.Text=d and "X" or ""; s.TextColor3=AC
 s.Font=Enum.Font.GothamBold; s.TextSize=12; s.AutoButtonColor=false
 Instance.new("UICorner",s).CornerRadius=UDim.new(0,4)
 local st=Instance.new("UIStroke",s); st.Color=BD; st.Thickness=1
 local v=d
 s.MouseButton1Click:Connect(function()
  v=not v; s.Text=v and "X" or ""; st.Color=v and AC or BD; ot(v)
 end)
 local ho=Instance.new("Frame",page)
 ho.Size=UDim2.new(1,0,0,0); ho.BackgroundTransparency=1; ho.Visible=false
 local hl=Instance.new("UIListLayout",ho); hl.Padding=UDim.new(0,6); hl.SortOrder=Enum.SortOrder.LayoutOrder
 local hp=Instance.new("UIPadding",ho)
 hp.PaddingLeft=UDim.new(0,10); hp.PaddingTop=UDim.new(0,4); hp.PaddingBottom=UDim.new(0,4)
 bd(ho)
 local ex=false
 ar.MouseButton1Click:Connect(function()
  ex=not ex; ho.Visible=ex; ar.Text=ex and "v" or ">"
  if ex then
   task.wait(0.05)
   local hgt=0
   for _,c in ipairs(ho:GetChildren()) do if c:IsA("GuiObject") then hgt=hgt+c.AbsoluteSize.Y+6 end end
   if hgt<10 then hgt=10 end
   ho.Size=UDim2.new(1,0,0,hgt)
  else ho.Size=UDim2.new(1,0,0,0) end
 end)
end

-- ESP
local HD=(Drawing~=nil and Drawing.new~=nil)
local ESPOn=false
local EBox=true
local EBoxC=AC
local EBoxT=1
local ESk=true
local ESkC=Color3.fromRGB(255,255,255)
local ETC=true
local EMxD=500
local ED={}
local SK={}
local function nSL()
 local l=Drawing.new("Line"); l.Thickness=1; l.Transparency=1; l.Visible=false; return l
end
local function gSL(plr,n)
 if not SK[plr] then SK[plr]={} end
 while #SK[plr]<n do table.insert(SK[plr],nSL()) end
 return SK[plr]
end
local function DestroyESPFor(plr)
 local d=ED[plr]
 if d and d.box then pcall(function() d.box:Remove() end) end
 ED[plr]=nil
 local lns=SK[plr]
 if lns then
  for _,l in ipairs(lns) do pcall(function() l:Remove() end) end
 end
 SK[plr]=nil
end
local function skelR6(ch)
 local h=ch:FindFirstChild("Head"); if not h then return {} end
 local t=ch:FindFirstChild("Torso"); if not t then return {} end
 local la=ch:FindFirstChild("Left Arm"); if not la then return {} end
 local ra=ch:FindFirstChild("Right Arm"); if not ra then return {} end
 local ll=ch:FindFirstChild("Left Leg"); if not ll then return {} end
 local rl=ch:FindFirstChild("Right Leg"); if not rl then return {} end
 local hp=h.Position; local hSz=h.Size
 local tp=t.Position; local tSz=t.Size
 local hb=hp-Vector3.new(0,hSz.Y*0.5,0)
 local tt=tp+Vector3.new(0,tSz.Y*0.5,0)
 local tb=tp-Vector3.new(0,tSz.Y*0.5,0)
 local tsL=tp+Vector3.new(-tSz.X*0.5,tSz.Y*0.4,0)
 local tsR=tp+Vector3.new(tSz.X*0.5,tSz.Y*0.4,0)
 local thL=tp+Vector3.new(-tSz.X*0.4,-tSz.Y*0.5,0)
 local thR=tp+Vector3.new(tSz.X*0.4,-tSz.Y*0.5,0)
 local laT=la.Position+Vector3.new(0,la.Size.Y*0.5,0)
 local laB=la.Position-Vector3.new(0,la.Size.Y*0.5,0)
 local raT=ra.Position+Vector3.new(0,ra.Size.Y*0.5,0)
 local raB=ra.Position-Vector3.new(0,ra.Size.Y*0.5,0)
 local llT=ll.Position+Vector3.new(0,ll.Size.Y*0.5,0)
 local llB=ll.Position-Vector3.new(0,ll.Size.Y*0.5,0)
 local rlT=rl.Position+Vector3.new(0,rl.Size.Y*0.5,0)
 local rlB=rl.Position-Vector3.new(0,rl.Size.Y*0.5,0)
 return {
  {hb,tt},{tt,tb},
  {tsL,laT},{laT,laB},
  {tsR,raT},{raT,raB},
  {thL,llT},{llT,llB},
  {thR,rlT},{rlT,rlB},
 }
end
local function skelR15(ch)
 local N={"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot"}
 local p={}
 for _,n in ipairs(N) do
  local o=ch:FindFirstChild(n)
  if not o then return {} end
  p[n]=o.Position
 end
 return {
  {p.Head,p.UpperTorso},
  {p.UpperTorso,p.LowerTorso},
  {p.UpperTorso,p.LeftUpperArm},
  {p.LeftUpperArm,p.LeftLowerArm},
  {p.LeftLowerArm,p.LeftHand},
  {p.UpperTorso,p.RightUpperArm},
  {p.RightUpperArm,p.RightLowerArm},
  {p.RightLowerArm,p.RightHand},
  {p.LowerTorso,p.LeftUpperLeg},
  {p.LeftUpperLeg,p.LeftLowerLeg},
  {p.LeftLowerLeg,p.LeftFoot},
  {p.LowerTorso,p.RightUpperLeg},
  {p.RightUpperLeg,p.RightLowerLeg},
  {p.RightLowerLeg,p.RightFoot},
 }
end
RS.RenderStepped:Connect(function()
 if not ESPOn or not HD then
  for plr,_ in pairs(ED) do DestroyESPFor(plr) end
  for plr,_ in pairs(SK) do DestroyESPFor(plr) end
  return
 end
 local cam=workspace.CurrentCamera
 if not cam then return end
 local vp=cam.ViewportSize
 local lt=LP.Team
 local lpp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
 for _,plr in ipairs(P:GetPlayers()) do
  if plr~=LP then
   local ch=plr.Character
   local hm=ch and ch:FindFirstChildOfClass("Humanoid")
   local hp=ch and ch:FindFirstChild("HumanoidRootPart")
   local vd=ch and hm and hp and hm.Health>0
   if vd and ETC and plr.Team and plr.Team==lt then vd=false end
   if vd and lpp and (hp.Position-lpp.Position).Magnitude>EMxD then vd=false end
   local d=ED[plr]
   if not vd then
    if d and d.box then d.box.Visible=false end
    if SK[plr] then for _,l in ipairs(SK[plr]) do l.Visible=false end end
   else
    if not d then
     d={}; d.box=Drawing.new("Square"); d.box.Filled=false; d.box.Visible=false
     ED[plr]=d
    end
    local tp,to=cam:WorldToViewportPoint(hp.Position+Vector3.new(0,3.2,0))
    local bp,bo=cam:WorldToViewportPoint(hp.Position-Vector3.new(0,2.8,0))
    local skip=false
    if not to or not bo or tp.Z<=0 or bp.Z<=0 then skip=true end
    if not skip then
     local ext=200
     if tp.X<-ext or tp.X>vp.X+ext or tp.Y<-ext or tp.Y>vp.Y+ext then skip=true end
     if bp.X<-ext or bp.X>vp.X+ext or bp.Y<-ext or bp.Y>vp.Y+ext then skip=true end
    end
    if not skip then
     local hgt=math.abs(bp.Y-tp.Y)
     if hgt<6 or hgt>vp.Y*2 then skip=true end
    end
    if skip then
     if d.box then d.box.Visible=false end
     if SK[plr] then for _,l in ipairs(SK[plr]) do l.Visible=false end end
    else
     local hgt=math.abs(bp.Y-tp.Y)
     local w=hgt*0.55
     local x=tp.X-w/2
     local y=tp.Y
     if EBox then
      d.box.Visible=true
      d.box.Position=Vector2.new(x,y)
      d.box.Size=Vector2.new(w,hgt)
      d.box.Color=EBoxC
      d.box.Thickness=EBoxT
      d.box.Transparency=1
     else d.box.Visible=false end
     if ESk then
      local bones=(hm.RigType==Enum.HumanoidRigType.R15) and skelR15(ch) or skelR6(ch)
      local lns=gSL(plr,math.max(#bones,1))
      for i,pr in ipairs(bones) do
       local ln=lns[i]
       local pa,oa=cam:WorldToViewportPoint(pr[1])
       local pb,ob=cam:WorldToViewportPoint(pr[2])
       if oa and ob and pa.Z>0 and pb.Z>0 then
        ln.From=Vector2.new(pa.X,pa.Y)
        ln.To=Vector2.new(pb.X,pb.Y)
        ln.Color=ESkC
        ln.Thickness=1
        ln.Transparency=1
        ln.Visible=true
       else ln.Visible=false end
      end
      if SK[plr] then for i=#bones+1,#SK[plr] do SK[plr][i].Visible=false end end
     else
      if SK[plr] then for _,l in ipairs(SK[plr]) do l.Visible=false end end
     end
    end
   end
  end
 end
end)

-- BHOP
local BhOn,BhB=false,false
local BhMx,BhGn,BhDl,BhDc=80,3,0,5
local NSp=16
local cSp=NSp
local lJ,lJT=0,0
local bhBV=nil
local Moves=mkTab("Movement")
Sec(Moves.Page,"Movement")
FB(Moves.Page,"Bhop",false,function(s)
 BhOn=s
 if not s then
  cSp=NSp
  if bhBV then pcall(function() bhBV:Destroy() end); bhBV=nil end
 end
end,function(h)
 Tog(h,"Speed Boost",false,function(s) BhB=s end)
 Sli(h,"Max Speed",20,200,80,function(v) BhMx=v end)
 Sli(h,"Gain per jump",1,10,3,function(v) BhGn=v end)
 Sli(h,"Decay/sec",1,20,5,function(v) BhDc=v end)
 Sli(h,"Delay (ms)",0,200,0,function(v) BhDl=v/1000 end)
end)
RS.Heartbeat:Connect(function(dt)
 if not BhOn then
  cSp=NSp
  if bhBV then pcall(function() bhBV:Destroy() end); bhBV=nil end
  return
 end
 local ch=LP.Character; if not ch then return end
 local hm=ch:FindFirstChildOfClass("Humanoid")
 local hp=ch:FindFirstChild("HumanoidRootPart")
 if not hm or not hp then return end
 if hm.Health<=0 then
  if bhBV then pcall(function() bhBV:Destroy() end); bhBV=nil end; return
 end
 local nw=tick()
 local md=hm.MoveDirection
 local mv=md.Magnitude>0.3
 local st=hm:GetState()
 local og=(st==Enum.HumanoidStateType.Landed) or (st==Enum.HumanoidStateType.Running) or (st==Enum.HumanoidStateType.RunningNoPhysics)
 if mv and og then
  local cd=BhDl>0 and BhDl or 0.05
  if nw-lJ>=cd then
   hm.Jump=true; lJ=nw
   if nw-lJT>0.1 and BhB then cSp=math.min(cSp+BhGn,BhMx) end
   lJT=nw
  end
 end
 if BhB then
  if not mv or (nw-lJT)>0.6 then cSp=math.max(cSp-BhDc*dt,NSp) end
 else cSp=NSp end
 if cSp>NSp+0.5 and mv then
  if not bhBV or bhBV.Parent~=hp then
   if bhBV then bhBV:Destroy() end
   bhBV=Instance.new("BodyVelocity")
   bhBV.MaxForce=Vector3.new(1e5,0,1e5); bhBV.P=1250
   bhBV.Velocity=Vector3.new(0,0,0); bhBV.Parent=hp
  end
  bhBV.Velocity=md.Unit*cSp
 else
  if bhBV then pcall(function() bhBV:Destroy() end); bhBV=nil end
 end
end)

-- JUMPBUG
local JBOn=false
local JBU,JBK,JBF=3,100,55
local JBC=0.25
local JBA,JBT=false,0
local jbBV=nil
local jbL=0
FB(Moves.Page,"JumpBug",false,function(s)
 JBOn=s
 if not s and jbBV then pcall(function() jbBV:Destroy() end); jbBV=nil end
end,function(h)
 Sli(h,"Height (studs)",1,20,3,function(v) JBU=v end)
 Sli(h,"Keep speed %",0,200,100,function(v) JBK=v end)
 Sli(h,"Jump force",20,200,55,function(v) JBF=v end)
 Sli(h,"Delay (ms)",50,800,250,function(v) JBC=v/1000 end)
 Lbl(h,"- JB Button -")
 Tog(h,"Lock JB Button",false,function(s) JBL=s end)
 Sli(h,"JB Button Size",30,150,80,function(v) JBB.Size=UDim2.new(0,v,0,v) end)
 Sli(h,"JB Text Size",12,60,24,function(v) JBB.TextSize=v end)
end)
RS.Heartbeat:Connect(function(dt)
 if not JBOn then return end
 if not jh then return end
 local ch=LP.Character; if not ch then return end
 local hm=ch:FindFirstChildOfClass("Humanoid")
 local hp=ch:FindFirstChild("HumanoidRootPart")
 if not hm or not hp then return end
 if hm.Health<=0 then return end
 local st=hm:GetState()
 local og=(st==Enum.HumanoidStateType.Landed) or (st==Enum.HumanoidStateType.Running) or (st==Enum.HumanoidStateType.RunningNoPhysics)
 if not og then return end
 local nw=tick()
 if nw-jbL<JBC then return end
 jbL=nw
 local v=hp.Velocity
 local hz=Vector3.new(v.X,0,v.Z)
 local md=hm.MoveDirection
 if md.Magnitude>0.1 then hz=md.Unit*math.max(hz.Magnitude,JBF*0.5) end
 local up=math.sqrt(2*196*JBU)+JBF*0.5
 local kp=hz*(JBK/100)
 if jbBV then jbBV:Destroy() end
 jbBV=Instance.new("BodyVelocity")
 jbBV.MaxForce=Vector3.new(1e5,1e5,1e5); jbBV.P=8000
 jbBV.Velocity=Vector3.new(kp.X,up,kp.Z); jbBV.Parent=hp
 task.delay(0.08,function()
  if jbBV and jbBV.Parent then jbBV:Destroy(); jbBV=nil end
 end)
 JBA=true; JBT=0.3
end)
RS.Heartbeat:Connect(function(dt)
 if JBT>0 then JBT=JBT-dt else JBA=false end
end)

-- EDGEBUG
local EBOn=false
local EBR=3
local EBM=15
local EBA=false
local EBT=0
FB(Moves.Page,"Edge Bug",false,function(s) EBOn=s end,function(h)
 Sli(h,"Ground radius",1,10,3,function(v) EBR=v end)
 Sli(h,"Min speed",5,100,15,function(v) EBM=v end)
 Lbl(h,"Auto on fall near ground")
end)
RS.Heartbeat:Connect(function()
 if not EBOn then EBA=false; return end
 local ch=LP.Character
 local hm=ch and ch:FindFirstChildOfClass("Humanoid")
 local hp=ch and ch:FindFirstChild("HumanoidRootPart")
 if not hm or not hp or hm.Health<=0 then EBA=false; return end
 if hm:GetState()~=Enum.HumanoidStateType.Freefall then EBA=false; return end
 local v=hp.Velocity
 local hz=Vector3.new(v.X,0,v.Z)
 if hz.Magnitude<EBM then EBA=false; return end
 if v.Y>=0 then EBA=false; return end
 local rp=RaycastParams.new()
 rp.FilterDescendantsInstances={ch}; rp.FilterType=Enum.RaycastFilterType.Exclude
 local ry=workspace:Raycast(hp.Position,Vector3.new(0,-(EBR+1),0),rp)
 if not ry then EBA=false; return end
 if ry.Distance>EBR then EBA=false; return end
 hp.Velocity=Vector3.new(v.X,0,v.Z)
 EBA=true; EBT=0.3
end)
RS.Heartbeat:Connect(function(dt)
 if EBT>0 then EBT=EBT-dt else EBA=false end
end)

-- AIRSTUCK
local aBV=nil
local aSP=nil
_G.KAMIBEBRA_airBV=nil
FB(Moves.Page,"Air Stuck",false,function(s)
 ASEn=s
 if not s then disAS(); aSP=nil end
end,function(h)
 Tog(h,"Lock AS Button",false,function(s) ASL=s end)
 Sli(h,"AS Button Size",30,150,80,function(v) ASB.Size=UDim2.new(0,v,0,v) end)
 Sli(h,"AS Text Size",12,60,24,function(v) ASB.TextSize=v end)
end)
RS.Heartbeat:Connect(function()
 if not ASEn or not ASOn then
  if aBV then pcall(function() aBV:Destroy() end); aBV=nil; _G.KAMIBEBRA_airBV=nil end
  aSP=nil; return
 end
 local ch=LP.Character
 local hm=ch and ch:FindFirstChildOfClass("Humanoid")
 local hp=ch and ch:FindFirstChild("HumanoidRootPart")
 if not hm or not hp or hm.Health<=0 then
  if aBV then pcall(function() aBV:Destroy() end); aBV=nil; _G.KAMIBEBRA_airBV=nil end
  return
 end
 if not aSP then aSP=hp.Position end
 hm.PlatformStand=true
 if not aBV or aBV.Parent~=hp then
  if aBV then aBV:Destroy() end
  aBV=Instance.new("BodyVelocity")
  aBV.MaxForce=Vector3.new(1e5,1e5,1e5); aBV.P=10000
  aBV.Velocity=Vector3.new(0,0,0); aBV.Parent=hp
  _G.KAMIBEBRA_airBV=aBV
 end
 aBV.Velocity=Vector3.new(0,0,0)
 if (hp.Position-aSP).Magnitude>0.5 then hp.CFrame=CFrame.new(aSP) end
end)

-- PIXEL SURF
local SuOn,DrMd,ShP=false,false,true
local SuSp=80
local SuP,CuM,CuB={},{},{}
local function mkMr(p)
 local pt=Instance.new("Part")
 pt.Anchored=true; pt.CanCollide=false; pt.CanQuery=false; pt.CanTouch=false
 pt.Transparency=0.2; pt.Size=Vector3.new(0.6,0.6,0.6); pt.Shape=Enum.PartType.Ball
 pt.Color=SC; pt.Material=Enum.Material.Neon; pt.Position=p; pt.Parent=workspace
 return pt
end
local function mkBm(a,b)
 local at1=Instance.new("Attachment",a)
 local at2=Instance.new("Attachment",b)
 local bm=Instance.new("Beam")
 bm.Attachment0=at1; bm.Attachment1=at2
 bm.Width0=0.5; bm.Width1=0.5; bm.FaceCamera=true; bm.LightEmission=1
 bm.Color=ColorSequence.new(SC); bm.Transparency=NumberSequence.new(0.15)
 bm.Parent=a; return bm
end
local function adPt(p)
 local m=mkMr(p); table.insert(CuM,m)
 if #CuM>=2 then table.insert(CuB,mkBm(CuM[#CuM-1],CuM[#CuM])) end
end
local function unPt()
 if #CuM==0 then return end
 local m=table.remove(CuM); m:Destroy()
 if #CuB>0 then local b=table.remove(CuB); b:Destroy() end
end
local function svPt()
 if #CuM<2 then return end
 table.insert(SuP,{markers=CuM,beams=CuB}); CuM={}; CuB={}
end
local function clPt()
 for _,pa in ipairs(SuP) do
  for _,m in ipairs(pa.markers) do m:Destroy() end
  for _,b in ipairs(pa.beams) do b:Destroy() end
 end
 SuP={}
 for _,m in ipairs(CuM) do m:Destroy() end
 for _,b in ipairs(CuB) do b:Destroy() end
 CuM={}; CuB={}
end
local function s2w(sp)
 local cm=workspace.CurrentCamera
 local ry=cm:ScreenPointToRay(sp.X,sp.Y)
 local rp=RaycastParams.new(); rp.FilterType=Enum.RaycastFilterType.Exclude
 local ex={LP.Character,Tg,M,PSB,JBB,ASB,WM}
 for _,pa in ipairs(SuP) do for _,m in ipairs(pa.markers) do table.insert(ex,m) end end
 for _,m in ipairs(CuM) do table.insert(ex,m) end
 rp.FilterDescendantsInstances=ex
 local r=workspace:Raycast(ry.Origin,ry.Direction*500,rp)
 if r then return r.Position+r.Normal*0.3 end
 return nil
end
UIS.InputBegan:Connect(function(inp,gp)
 if gp then return end
 if not DrMd then return end
 if inp.UserInputType~=Enum.UserInputType.MouseButton1 and inp.UserInputType~=Enum.UserInputType.Touch then return end
 local ps=inp.Position
 if M.Visible then
  local mP,mS=M.AbsolutePosition,M.AbsoluteSize
  if ps.X>=mP.X and ps.X<=mP.X+mS.X and ps.Y>=mP.Y and ps.Y<=mP.Y+mS.Y then return end
 end
 if WM.Visible then
  local wP,wS=WM.AbsolutePosition,WM.AbsoluteSize
  if ps.X>=wP.X and ps.X<=wP.X+wS.X and ps.Y>=wP.Y and ps.Y<=wP.Y+wS.Y then return end
 end
 local wp=s2w(ps)
 if wp then adPt(wp) end
end)
local function fCl(hp)
 local bs,bsD,bsP,bsS=nil,math.huge,nil,nil
 for _,pa in ipairs(SuP) do
  for i=1,#pa.markers-1 do
   local p1=pa.markers[i].Position
   local p2=pa.markers[i+1].Position
   local sg=p2-p1
   local sl=sg.Magnitude
   if sl>0.01 then
    local t=math.clamp((hp.Position-p1):Dot(sg)/(sl*sl),0,1)
    local cl=p1+sg*t
    local d=(hp.Position-cl).Magnitude
    if d<bsD then bsD=d; bs=cl; bsP=pa; bsS=i end
   end
  end
 end
 return bs,bsD,bsP,bsS
end
local suBV=nil
local isAt=false
local lkP,lkS,lkD=nil,nil,nil
RS.Heartbeat:Connect(function()
 local sh=DrMd or (SuOn and ShP)
 for _,pa in ipairs(SuP) do
  for _,m in ipairs(pa.markers) do if m.Parent then m.Transparency=sh and 0.2 or 1 end end
  for _,b in ipairs(pa.beams) do if b.Parent then b.Enabled=sh end end
 end
 PSB.Visible=SuOn and not DrMd
 JBB.Visible=JBOn and not DrMd
 ASB.Visible=ASEn and not DrMd
 if not SuOn or DrMd then
  isAt=false
  if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
  return
 end
 if ASOn then
  isAt=false
  if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
  return
 end
 local ch=LP.Character
 local hm=ch and ch:FindFirstChildOfClass("Humanoid")
 local hp=ch and ch:FindFirstChild("HumanoidRootPart")
 if not hm or not hp or hm.Health<=0 then
  isAt=false
  if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
  return
 end
 if psh and not psm then
  if not isAt then
   local cl,d,pa,si=fCl(hp)
   if cl and pa and si then
    isAt=true; lkP=pa; lkS=si
    local p1=pa.markers[si].Position
    local p2=pa.markers[si+1].Position
    local su=(p2-p1).Unit
    local rf
    if hm.MoveDirection.Magnitude>0.1 then rf=hm.MoveDirection.Unit
    else rf=workspace.CurrentCamera.CFrame.LookVector end
    if rf:Dot(su)<0 then su=-su end
    lkD=su
   else return end
  end
  if lkP and lkD then
   local p1=lkP.markers[lkS].Position
   local p2=lkP.markers[lkS+1].Position
   local sv=p2-p1
   local sl=sv.Magnitude
   if sl<0.01 then
    isAt=false
    if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
    return
   end
   local su=sv.Unit
   local pr=(hp.Position-p1):Dot(su)
   if pr>=sl then
    if lkS<#lkP.markers-1 then
     lkS=lkS+1
     local n1=lkP.markers[lkS].Position
     local n2=lkP.markers[lkS+1].Position
     local ns=(n2-n1).Unit
     if ns:Dot(lkD)<0 then
      isAt=false
      if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
      return
     end
    else
     isAt=false
     if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
     return
    end
   elseif pr<0 then
    if lkS>1 then lkS=lkS-1
    else
     isAt=false
     if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
     return
    end
   end
   p1=lkP.markers[lkS].Position
   p2=lkP.markers[lkS+1].Position
   sv=p2-p1; sl=sv.Magnitude
   if sl<0.01 then
    isAt=false
    if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
    return
   end
   su=sv.Unit
   if su:Dot(lkD)<0 then su=-su end
   lkD=su
   local t=math.clamp((hp.Position-p1):Dot(su)/sl,0,1)
   local cp=p1+su*(t*sl)
   if not suBV or suBV.Parent~=hp then
    if suBV then suBV:Destroy() end
    suBV=Instance.new("BodyVelocity")
    suBV.MaxForce=Vector3.new(1e5,1e5,1e5); suBV.P=1250
    suBV.Parent=hp
   end
   local tp=cp-hp.Position
   local dP=tp.Magnitude
   local vl=lkD*SuSp
   if dP>1 then vl=vl+tp.Unit*math.min(dP*3,20) end
   suBV.Velocity=vl
  end
 else
  if isAt then
   isAt=false
   if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
  end
 end
end)
FB(Moves.Page,"Pixel Surf",false,function(s)
 SuOn=s
 if not s then
  isAt=false
  if suBV then pcall(function() suBV:Destroy() end); suBV=nil end
 end
end,function(h)
 Tog(h,"Edit Mode",false,function(s) DrMd=s end)
 Tog(h,"Show Paths",true,function(s) ShP=s end)
 Sli(h,"Surf Speed",20,200,80,function(v) SuSp=v end)
 Lbl(h,"- Line Color -")
 CP(h,"Marker/Beam Color",SC,function(c)
  SC=c
  for _,pa in ipairs(SuP) do
   for _,m in ipairs(pa.markers) do if m.Parent then m.Color=c end end
   for _,b in ipairs(pa.beams) do if b.Parent then b.Color=ColorSequence.new(c) end end
  end
  for _,m in ipairs(CuM) do if m.Parent then m.Color=c end end
  for _,b in ipairs(CuB) do if b.Parent then b.Color=ColorSequence.new(c) end end
 end)
 Lbl(h,"- PS Button -")
 Tog(h,"Lock PS Button",false,function(s) PSL=s end)
 Sli(h,"PS Button Size",30,150,80,function(v) PSB.Size=UDim2.new(0,v,0,v) end)
 Sli(h,"PS Text Size",12,60,24,function(v) PSB.TextSize=v end)
 Lbl(h,"- Actions -")
 Btn(h,"Save Path",function() svPt() end)
 Btn(h,"Undo Point",function() unPt() end)
 Btn(h,"Clear All",function() clPt() end)
end)

-- HUD UPDATE
local hAcc=0
RS.Heartbeat:Connect(function(dt)
 if not HudOn then
  HS.Visible=false; HP.Visible=false; HJ.Visible=false
  HE.Visible=false; HA.Visible=false
  return
 end
 HS.Visible=ShSp
 HP.Visible=ShPS
 if ShJB then HJ.Visible=JBA else HJ.Visible=false end
 if ShEB then HE.Visible=EBA else HE.Visible=false end
 if ShAir then HA.Visible=ASOn else HA.Visible=false end
 hAcc=hAcc+dt
 if hAcc<0.05 then return end
 hAcc=0
 local ch=LP.Character; if not ch then return end
 local hp=ch:FindFirstChild("HumanoidRootPart"); if not hp then return end
 local v=hp.Velocity
 local sp=math.floor(Vector3.new(v.X,0,v.Z).Magnitude+0.5)
 if ShSp then
  HS.Text=tostring(sp); HS.TextColor3=TX
 end
 if ShPS then HP.TextColor3=isAt and CHPS or TX end
 if ShJB and JBA then HJ.TextColor3=CHJB end
 if ShEB and EBA then HE.TextColor3=CHEB end
 if ShAir and ASOn then HA.TextColor3=CHAI end
end)

-- VISUALS
local Vis=mkTab("Visuals")
Sec(Vis.Page,"Visuals")
FB(Vis.Page,"Watermark",true,function(s) WM.Visible=s end,function(h)
 Tog(h,"Lock Position",false,function(s) WML=s end)
 Sli(h,"Size %",50,200,100,function(v) WMSca.Scale=v/100 end)
 Sli(h,"BG Opacity %",0,100,15,function(v) WM.BackgroundTransparency=v/100 end)
 Lbl(h,"kamibebra | nick | fps | ping")
end)
FB(Vis.Page,"Movement HUD",true,function(s) HudOn=s end,function(h)
 Tog(h,"Velocity",true,function(s) ShSp=s end)
 Tog(h,"PS",true,function(s) ShPS=s end)
 Tog(h,"JB",true,function(s) ShJB=s end)
 Tog(h,"EB",true,function(s) ShEB=s end)
 Tog(h,"Airstuck",true,function(s) ShAir=s end)
 Lbl(h,"- HUD Position -")
 Tog(h,"Lock Position",false,function(s) HudL=s end)
 Lbl(h,"Unlock and drag HUD by finger")
 Sli(h,"Offset X",-500,500,0,function(v) if HudL then return end; HOX=v; uHP() end)
 Sli(h,"Offset Y",-500,500,0,function(v) if HudL then return end; HOY=v; uHP() end)
 Btn(h,"Reset HUD Position",function() HOX=0; HOY=0; uHP() end)
 Lbl(h,"- Active Colors -")
 CP(h,"PS active",CHPS,function(c) CHPS=c end)
 CP(h,"JumpBug active",CHJB,function(c) CHJB=c end)
 CP(h,"EdgeBug active",CHEB,function(c) CHEB=c end)
 CP(h,"AirStuck active",CHAI,function(c) CHAI=c end)
end)
FB(Vis.Page,"ESP",false,function(s) ESPOn=s end,function(h)
 if not HD then Lbl(h,"Drawing API unavailable") end
 Lbl(h,"- General -")
 Tog(h,"Team Check",true,function(s) ETC=s end)
 Sli(h,"Max Distance",50,2000,500,function(v) EMxD=v end)
 Lbl(h,"- Box -")
 Tog(h,"Box",true,function(s) EBox=s end)
 CP(h,"Box Color",EBoxC,function(c) EBoxC=c end)
 Sli(h,"Box Thickness",1,5,1,function(v) EBoxT=v end)
 Lbl(h,"- Skeleton -")
 Tog(h,"Skeleton",true,function(s) ESk=s end)
 CP(h,"Skeleton Color",ESkC,function(c) ESkC=c end)
end)

-- COMBAT
local Com=mkTab("Combat")
Sec(Com.Page,"Combat")
Lbl(Com.Page,"Soon")

-- SETTINGS
local SetT=mkTab("Settings")
Sec(SetT.Page,"Interface")
Sli(SetT.Page,"Menu Size %",50,200,100,function(v)
 if SL then return end
 US.Scale=v/100
end)
Tog(SetT.Page,"Lock Scale",false,function(s) SL=s end)
Btn(SetT.Page,"Reset Size",function() SL=false; US.Scale=1 end)

-- UNLOAD
local Unl=mkTab("Unload")
Sec(Unl.Page,"Unload")
Lbl(Unl.Page,"Full unload")
Btn(Unl.Page,"UNLOAD SCRIPT",function()
 if bhBV then pcall(function() bhBV:Destroy() end) end
 if suBV then pcall(function() suBV:Destroy() end) end
 if jbBV then pcall(function() jbBV:Destroy() end) end
 if aBV then pcall(function() aBV:Destroy() end) end
 if _G.KAMIBEBRA_airBV then pcall(function() _G.KAMIBEBRA_airBV:Destroy() end); _G.KAMIBEBRA_airBV=nil end
 for plr,_ in pairs(ED) do DestroyESPFor(plr) end
 for plr,_ in pairs(SK) do DestroyESPFor(plr) end
 local ch=LP.Character
 if ch then
  local hm=ch:FindFirstChildOfClass("Humanoid")
  if hm then hm.PlatformStand=false end
 end
 clPt()
 SG:Destroy()
end)

AT=Tabs[1]
Tabs[1].Page.Visible=true
Tabs[1].Button.BackgroundColor3=PN2
Tabs[1].Button.TextColor3=TX
Tabs[1].Stripe.Visible=true
warn("[KAMIBEBRA] Loaded v1.8")