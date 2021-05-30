// Created by Crowbar 0.71

$modelname "weapons/c_brickbat.mdl"

$bodygroup "studio"
{
	studio "c_BB_Headcrab_nohand.smd"
}


$surfaceprop "default"

$contents "solid"

$illumposition -6.467 -17.288 -11.844

$cdmaterials "models\Weapons\V_BB_Headcrab\\"

$cbox 0 0 0 0 0 0

$bbox -2.767 -18.387 -24.817 37.342 5.453 1.129

$definebone "Bip01" "" 0.134138 2.728104 43.181469 0 -89.999927 0 0 0 0 0 0 0
$definebone "Bip01 Pelvis" "Bip01" 0 0 0 -89.980215 -89.999927 0 0 0 0 0 0 0
$definebone "Bip01 Spine" "Bip01 Pelvis" 4.443615 -0.009642 0.000006 -0.000057 0.045607 -0.000229 0 0 0 0 0 0
$definebone "Bip01 Neck" "Bip01 Spine" 12.111401 -0.011446 0 0 0 0 0 0 0 0 0 0
$definebone "Bip01 R Clavicle" "Bip01 Neck" 0.000008 0.011449 -1.352403 78.540823 179.953614 -0.000802 0 0 0 0 0 0
$definebone "Bip01 R UpperArm" "Bip01 R Clavicle" 6.078084 0 0 -2.569601 -88.156548 72.743775 0 0 0 0 0 0
$definebone "Bip01 R Forearm" "Bip01 R UpperArm" 13.446753 -0.000004 0 0 -3.959138 -0.000001 0 0 0 0 0 0
$definebone "Bip01 R Hand" "Bip01 R Forearm" 15.997001 0 0.000001 0 0 96.454354 0 0 0 0 0 0
$definebone "Dummy14" "Bip01 R Hand" 7.051338 4.316994 -1.100494 -47.060779 -179.808022 90.96267 0 0 0 0 0 0
$definebone "Bip01 R Finger0" "Bip01 R Hand" 1.885321 0.833276 2.177902 -33.197096 41.211572 66.220917 0 0 0 0 0 0
$definebone "Bip01 R Finger01" "Bip01 R Finger0" 1.506962 0 0.000008 0.000056 -7.999947 0.000045 0 0 0 0 0 0
$definebone "Bip01 R Finger02" "Bip01 R Finger01" 0.798347 -0.000004 0.000008 -0.000058 -8.500368 0.000047 0 0 0 0 0 0
$definebone "Bip01 R Finger1" "Bip01 R Hand" 3.950285 -0.53989 2.10894 -8.63985 16.687329 -2.532073 0 0 0 0 0 0
$definebone "Bip01 R Finger11" "Bip01 R Finger1" 1.545803 0 0.000023 0.00018 24.499955 0.000236 0 0 0 0 0 0
$definebone "Bip01 R Finger12" "Bip01 R Finger11" 1.6674 0.000008 0.000015 -0.000226 18.000376 -0.000737 0 0 0 0 0 0
$definebone "Bip01 R Finger2" "Bip01 R Hand" 3.899448 -0.475396 1.170952 -0.000114 -0.000286 0.045492 0 0 0 0 0 0
$definebone "Bip01 R Finger21" "Bip01 R Finger2" 1.528225 -0.000002 0.000031 0.000173 13.999534 -0.000058 0 0 0 0 0 0
$definebone "Bip01 R Finger22" "Bip01 R Finger21" 1.528204 0.000011 0.000015 -0.000344 27.499959 -0.001089 0 0 0 0 0 0
$definebone "Bip01 R Finger3" "Bip01 R Hand" 3.899458 -0.431832 -0.168159 -0.000114 -0.000286 0.045549 0 0 0 0 0 0
$definebone "Bip01 R Finger31" "Bip01 R Finger3" 1.506958 -0.000003 0.000019 -0.000114 15.499419 -0.000401 0 0 0 0 0 0
$definebone "Bip01 R Finger32" "Bip01 R Finger31" 1.506968 0.000011 0.000019 -0.000171 -1.999632 -0.000172 0 0 0 0 0 0
$definebone "Bip01 R Finger4" "Bip01 R Hand" 3.915642 -0.278056 -1.402538 -0.000114 -0.000401 0.045549 0 0 0 0 0 0
$definebone "Bip01 R Finger41" "Bip01 R Finger4" 1.333084 0.000002 0.000027 0.000001 5.000202 -0.000115 0 0 0 0 0 0
$definebone "Bip01 R Finger42" "Bip01 R Finger41" 1.159203 -0.000005 0.000019 -0.000458 12.499294 -0.000802 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "Bip01 R Hand" 0.303488 0.066151 0.389011 3.078634 -0.03362 179.601969 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "Bip01 R Forearm" 4.830911 -0.176426 -0.458756 -0.600203 -0.041884 -0.018963 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "Bip01 R UpperArm" 6.563 -0.345718 -0.35479 -0.601423 0.008886 -0.014011 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859678 -0.132556 1.193066 -10.389156 -10.306392 -0.547829 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312559 -0.000003 -0.000008 0.000014 0.000003 -0.439667 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729364 -0.000008 -0.000004 -0.000011 0.000006 -0.244286 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942303 0.050332 0.431 -10.139561 -10.096566 -0.690809 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539097 0 -0.000015 0.000009 0.000012 -0.247782 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196318 0.00001 -0.000011 0.000006 0.000001 -0.430755 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883667 -0.050342 -0.431084 -10.091897 -10.092196 -0.657491 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719576 -0.000002 -0.000027 0.00001 -0.007969 -0.366435 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209175 -0.00001 -0.000027 -0.000008 -0.004452 -0.216382 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859833 -0.14896 -1.331318 -10.415416 -10.322789 -0.763546 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719428 0.000023 -0.000008 0.000009 -0.006616 -0.362969 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099663 0.000005 -0.000008 -0.000005 -0.004212 -0.244312 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806015 -0.359853 -1.31834 60.834234 -30.739813 91.319055 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789783 0.000019 -0.000004 0.000003 0.000004 0.152921 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207001 0.000011 -0.000011 0.000009 50.000007 0.362923 0 0 0 0 0 0

$bonemerge "Bip01"
$bonemerge "Bip01 Pelvis"
$bonemerge "Bip01 Spine"
$bonemerge "Bip01 Neck"
$bonemerge "Bip01 R Clavicle"
$bonemerge "Bip01 R UpperArm"
$bonemerge "Bip01 R Forearm"
$bonemerge "Bip01 R Hand"
$bonemerge "ValveBiped.Bip01_R_Hand"
$bonemerge "ValveBiped.Bip01_R_Forearm"
$bonemerge "ValveBiped.Bip01_R_UpperArm"
$bonemerge "ValveBiped.Bip01_R_Finger4"
$bonemerge "ValveBiped.Bip01_R_Finger41"
$bonemerge "ValveBiped.Bip01_R_Finger42"
$bonemerge "ValveBiped.Bip01_R_Finger3"
$bonemerge "ValveBiped.Bip01_R_Finger31"
$bonemerge "ValveBiped.Bip01_R_Finger32"
$bonemerge "ValveBiped.Bip01_R_Finger2"
$bonemerge "ValveBiped.Bip01_R_Finger21"
$bonemerge "ValveBiped.Bip01_R_Finger22"
$bonemerge "ValveBiped.Bip01_R_Finger1"
$bonemerge "ValveBiped.Bip01_R_Finger11"
$bonemerge "ValveBiped.Bip01_R_Finger12"
$bonemerge "ValveBiped.Bip01_R_Finger0"
$bonemerge "ValveBiped.Bip01_R_Finger01"
$bonemerge "ValveBiped.Bip01_R_Finger02"


$sequence "HC_idle" {
	"c_brickbat_anims\HC_idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "HC_draw" {
	"c_brickbat_anims\HC_draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "HC_pullback" {
	"c_brickbat_anims\HC_pullback.smd"
	activity "ACT_VM_PULLBACK" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "HC_throw" {
	"c_brickbat_anims\HC_throw.smd"
	activity "ACT_VM_THROW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}
