Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '362,150'
$Form.text                       = "Switch between Hyper-V and VirtualBox"
$Form.TopMost                    = $false
$Form.MaximumSize                = '362,160'
$Form.MinimumSize                = '362,160'
$Form.MaximizeBox                = $false
$Form.MinimizeBox                = $false


$btnHyperV                       = New-Object system.Windows.Forms.Button
$btnHyperV.text                  = "Hyper-V"
$btnHyperV.width                 = 150
$btnHyperV.height                = 30
$btnHyperV.location              = New-Object System.Drawing.Point(20,71)
$btnHyperV.Font                  = 'Microsoft Sans Serif,10'

$btnVirtualBox                   = New-Object system.Windows.Forms.Button
$btnVirtualBox.text              = "VirtualBox"
$btnVirtualBox.width             = 150
$btnVirtualBox.height            = 30
$btnVirtualBox.location          = New-Object System.Drawing.Point(185,71)
$btnVirtualBox.Font              = 'Microsoft Sans Serif,10'

$lblInfo                         = New-Object system.Windows.Forms.Label
$lblInfo.text                    = "Choose hypervisor that you want to use (this will restart this computer)"
$lblInfo.AutoSize                = $false
$lblInfo.width                   = 319
$lblInfo.height                  = 44
$lblInfo.location                = New-Object System.Drawing.Point(20,17)
$lblInfo.Font                    = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($btnHyperV,$btnVirtualBox,$lblInfo))

$btnVirtualBox.Add_Click({ btnVirtualBox_Clicked })
$btnHyperV.Add_Click({ btnHyperV_Clicked })

function btnHyperV_Clicked {
    bcdedit /set hypervisorlaunchtype auto
    Restart-Computer
}
function btnVirtualBox_Clicked { 
    bcdedit /set hypervisorlaunchtype off
    Restart-Computer
}

[void]$Form.ShowDialog()
