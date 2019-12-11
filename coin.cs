global int $sprite[64];
//5 animation frames, 64 pixels stored
global matrix $coinAn [5] [64];
global int $k;
global string $shaders[];
global string $sPlane[];

//assign names to new palette

$shaders = {
    "red","orange", "yellow", "green", "blue", "purple", "brown", "black", "white", "grey", "trans", "hilite"
};
//assign rgba values to the new palette
 
float $r[] = {float(1),(1.0),(1.0),(0.0),(0.0),(0.5),(0.2),(0.0),(1.0),(0.5),(0.5),(1.0)};
float $g[] = {float(0),(0.5),(1.0),(1.0),(0.0),(0.0),(0.3),(0.0),(1.0),(0.5),(0.5),(1.0)};
float $b[] = {float(0),(0.0),(0.0),(0.0),(1.0),(1.0),(0.1),(0.0),(1.0),(0.5),(0.5),(1.0)};
float $a[] = {float(0),(0.0),(0.0),(0.0),(0.0),(0.0),(0.0),(0.0),(0.0),(0.0),(1.0),(0.0)};

//create the shaders 

$i = 0;
for ($one in $shaders)
{
shadingNode -n $one -asShader lambert;
sets -renderable true -noSurfaceShader true -empty -name ($one + "SG");
connectAttr -f ($one + ".outColor") ($one + "SG.surfaceShader");
setAttr ($one+".colorR") ($r[$i]) ;
setAttr ($one+".colorG") ($g[$i]) ;
setAttr ($one+".colorB") ($b[$i]) ;
addAttr -keyable true -ln "index" -at long -dv ($i) $one;
for ($rgb in {"R","G","B"}){
    setAttr ($one+".transparency"+$rgb) ($a[$i]) ;
}
$i++ ;
}
//create an 8 x 8 sprite as a polyPlane

$sPlane = `polyPlane -ch on -o on -w 8 -h 8 -sw 8 -sh 8 -cuv 2 -n "spritePlane"`;
move 0 4 0;
rotate -x -90;

//the default coin animation cycle 

$coinAn = << 10, 10, 11, 2, 2, 1, 10, 10, 10, 11, 2, 1, 2, 2, 1, 10, 10, 2, 2, 2, 1, 2, 1, 10, 10, 2, 2, 2, 1, 2, 1, 10, 10, 2, 2, 2, 1, 2, 1, 10, 10, 2, 2, 2, 1, 2, 1, 10, 10, 2, 2, 1, 2, 2, 1, 10, 10, 10, 2, 2, 2, 1, 10, 10;
   10, 10, 10, 2, 1, 10, 10, 10, 10, 10, 2, 2, 2, 1, 10, 10, 10, 10, 2, 1, 2, 1, 10, 10, 10, 10, 2, 1, 2, 1, 10, 10, 10, 10, 2, 1, 2, 1, 10, 10, 10, 10, 2, 1, 2, 1, 10, 10, 10, 10, 2, 2, 2, 1, 10, 10, 10, 10, 10, 2, 1, 10, 10, 10;
   10, 10, 10, 2, 2, 10, 10, 10, 10, 10, 10, 8, 8, 10, 10, 10, 10, 10, 10, 8, 8, 10, 10, 10, 10, 10, 10, 8, 8, 10, 10, 10, 10, 10, 10, 8, 8, 10, 10, 10, 10, 10, 10, 8, 8, 10, 10, 10, 10, 10, 10, 8, 8, 10, 10, 10, 10, 10, 10, 2, 2, 10, 10, 10;
   10, 10, 10, 11, 2, 10, 10, 10, 10, 10, 11, 2, 2, 2, 10, 10, 10, 10, 11, 2, 11, 2, 10, 10, 10, 10, 11, 2, 11, 2, 10, 10, 10, 10, 11, 2, 11, 2, 10, 10, 10, 10, 11, 2, 11, 2, 10, 10, 10, 10, 11, 2, 2, 2, 10, 10, 10, 10, 10, 11, 2, 10, 10, 10;
   10, 10, 8, 2, 2, 2, 10, 10, 10, 8, 2, 2, 8, 2, 2, 10, 10, 8, 2, 1, 2, 8, 2, 10, 10, 8, 2, 1, 2, 8, 2, 10, 10, 8, 2, 1, 2, 8, 2, 10, 10, 8, 2, 1, 2, 8, 2, 10, 10, 8, 2, 2, 1, 2, 2, 10, 10, 10, 8, 2, 2, 2, 10, 10>>;

//save the animation frame
proc saveFrame() {
    int $getIndex;
    global string $sPlane[];
    global matrix $coinAn [5] [64];    
    for ($i=0;$i<64;$i++){
        select -r ($sPlane[0]+".f["+$i+"]");
        hyperShade -smn;
        $obj = `ls - sl`;
        $getIndex = `getAttr ($obj[0]+".index")`;
        $coinAn [4] [$i] = $getIndex;
    }
}

global proc coin(){  
global string $shaders[];
global string $sPlane[];
global int $sprite[];
global matrix $coinAn [5] [64];
global int $k, $i;
        if (timerquery() > 0.1) {
            if ($k > 4) $k = 0;
            for ($i=0;$i<64;$i++){
                $sprite[$i] = $coinAn [$k] [$i];
            }
            for ($i=0;$i<(size($sprite));$i++){
                sets -e -forceElement ($shaders[($sprite[$i])]+"SG") ($sPlane[0]+".f["+$i+"]");
            }
            $k++;
        timerstart;
    }
 }

global proc timerstart()
{
    global float $GstartTime;
    $GstartTime = `timerX`;
}
global proc float timerquery()
{
    global float $GstartTime;
    return (`timerX -startTime $GstartTime`);
}

	global proc coinAnim()
	{
		global int $coinIndex;
		if ($coinIndex == 0)
			$coinIndex = -1;
		if (!`scriptJob -ex $coinIndex`)
		{
			$coinIndex = `scriptJob -kws -e idle coin`;
		}
		else
		{
			scriptJob -k $coinIndex -f;
		}
	}


// coinAnim;
