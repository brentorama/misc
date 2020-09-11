
global string $fClip;
global string $nClip;
global string $actCam; 
float $v;
string $actCam = `lookThru -q`;
if (`window -exists bTools`){ 
deleteUI bTools;}
    window -s false -w 400 -h 100 -title "Brents Tools" -iconName "bTools" -widthHeight 200 100 bTools;
			columnLayout;
				frameLayout -collapsable true -label "SetupTools";
                    rowColumnLayout -w 400 -numberOfColumns 3;
                        button -w 130 -bgc 0.1 0 0.5 -l "Rivet" -command "doRivet" ;
                        button -w 130 -bgc 0.05 0.02 0.47 -l "attMan" -command "doAttman";
                        button -w 130 -bgc 0 0.05 0.45 -l "wireColor" -command "wireColor";
                        button -w 130 -bgc 0 0.1 0.4 -l "hiZero" -command "HiZero";
                        button -bgc 0.1 0.15 0.35 -l "zeroEnds" -command "zeroEnds";
                        button -bgc 0.1 0.2 0.3 -l "sprCheckCage" -command "sCC" ;
                        button -bgc 0 0.25 0.25 -l "sprCheckSkeleton" -command "sCS";
                        button -bgc 0 0.3 0.2 -l "sprConnect" -command "sprCon" ;
                        button -bgc 0.1 0.35 0.15 -l "sprDisconnect" -command "sprDiscon";
                        button -bgc 0.1 0.4 0.1 -l "selectInfluences" -command "selInf";
                    setParent bTools;
				frameLayout -collapsable true -label "CameraTools";
				    	columnLayout -w 400;
                       string $nClip = `floatSliderGrp -cw3 50 50 280 -pre 3 -label "NearPlane" -field true -minValue 0.1 -maxValue 3 -value 0.1 -dragCommand "nearClip" `;
					      string $fClip = `floatSliderGrp -cw3 50 50 280 -pre 2 -label "FarPlane" -field true -minValue 0.1 -maxValue 1000 -value 1000 -dragCommand "farClip" `;
				setParent bTools;
		showWindow;

global proc nearClip()
{
global string $nClip;
global string $actCam;
float $v = `floatSliderGrp -q -v $nClip`;
setAttr ($actCam+"Shape.nearClipPlane") $v;
}

global proc farClip()
{
global string $fClip;
global string $actCam;
float $v = `floatSliderGrp -q -v $fClip`;
setAttr ($actCam+"Shape.farClipPlane") $v;
}


proc wireColor()
{
source "Y:/forrest/Scripts/wireColor.mel" ;
}

proc doRivet()
{
source "Y:/forrest/Scripts/rivet.mel" ;
}
proc doAttman()
{
source "Y:/forrest/Scripts/attMan.mel" ;
attributeMan ;
}
proc HiZero()
{
string $doolie[];
$doolie =`ls -sl`;
select -hi;
rotate 0 0 0 ;
select -r $doolie ;
}
proc zeroEnds()
{
source "Y:/forrest/Scripts/zeroEnds.mel" ;
}
proc sCC()
{
print "sprCheckCage \"|cageGP\" {\"hierarchy\",\"1\"}" ;
sprCheckCage "|cageGP" {"hierarchy","1"} ;
}
proc sCS()
{
print "sprCheckSkeleton \"pelvisJT\" {\"hierarchy\",\"1\"}" ;
sprCheckSkeleton "pelvisJT" {"hierarchy","1"} ;
}
proc sprCon()
{
sprSetupHumanTemplate "connectInfluence" {"revision", "2.0"};
}
proc sprDiscon()
{
select -r pelvisIF;
sprDisconnectInfluence {};
}

proc selInf()
{
string $skinnyBones[] = `skinCluster -q -inf`;
select -r $skinnyBones;
int $size = size($skinnyBones);
for($i=0;$i<$size;++$i) {
$value = $skinnyBones[ $i ]; 
print( $value + " " + $size);
}
}
