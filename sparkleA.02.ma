//Maya ASCII 2016 scene
//Name: sparkleA.02.ma
//Last modified: Mon, Nov 20, 2017 10:06:58 PM
//Codeset: 1252
requires maya "2016";
requires -dataType "byteArray" "Mayatomr" "2016.0 - 3.13.1.2 ";
requires "stereoCamera" "10.0";
requires "clgSymbolMaker" "2.0";
requires "clgMatrixNodes.py" "1.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2016";
fileInfo "version" "2016";
fileInfo "cutIdentifier" "201502261600-953408";
fileInfo "osv" "Microsoft Windows 8 Home Premium Edition, 64-bit  (Build 9200)\n";
createNode transform -n "root";
	rename -uid "499F3C37-4547-7831-FCBD-B7ACF471AFC3";
	addAttr -ci true -sn "Element" -ln "Element" -dt "string";
	addAttr -ci true -sn "LOD" -ln "LOD" -dt "string";
	addAttr -ci true -sn "illum" -ln "illum" -dt "string";
	addAttr -ci true -k true -sn "namespace" -ln "namespace" -dt "string";
	setAttr ".rp" -type "double3" -17.648362455545836 9.0115985319483265 0.33488210753477654 ;
	setAttr ".sp" -type "double3" -17.648362455545836 9.0115985319483265 0.33488210753477654 ;
	setAttr ".Element" -type "string" "sparkleA";
	setAttr ".LOD" -type "string" "HH";
	setAttr -k on ".illum";
createNode transform -n "renderGP" -p "root";
	rename -uid "D09ECE09-48E4-7280-3DAE-BCAC1090DDE2";
	setAttr ".rp" -type "double3" -17.648362455545836 9.0115985319483265 0.33488210753477654 ;
	setAttr ".sp" -type "double3" -17.648362455545836 9.0115985319483265 0.33488210753477654 ;
createNode instancer -n "inst" -p "renderGP";
	rename -uid "2FD17960-48FE-4C3D-B9FB-E9B38E33E0C4";
	setAttr -s 4 ".inh";
createNode transform -n "particleA" -p "renderGP";
	rename -uid "69BBC3A8-4219-1356-DAF9-FDBC81E63688";
createNode nParticle -n "shape" -p "particleA";
	rename -uid "4EA86DCD-43CF-E954-C175-46AAE88F8AF9";
	addAttr -s false -ci true -sn "lifespanPP" -ln "lifespanPP" -dt "doubleArray";
	addAttr -ci true -h true -sn "lifespanPP0" -ln "lifespanPP0" -dt "doubleArray";
	addAttr -ci true -sn "lifespan" -ln "lifespan" -at "double";
	addAttr -is true -ci true -sn "colorAccum" -ln "colorAccum" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -sn "useLighting" -ln "useLighting" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -sn "pointSize" -ln "pointSize" -dv 2 -min 1 -max 60 -at "long";
	addAttr -is true -ci true -sn "normalDir" -ln "normalDir" -dv 2 -min 1 -max 3 -at "long";
	addAttr -ci true -h true -sn "aimPP0" -ln "aimPP0" -dt "vectorArray";
	addAttr -s false -ci true -sn "aimPP" -ln "aimPP" -dt "vectorArray";
	addAttr -ci true -sn "typePP" -ln "typePP" -dt "doubleArray";
	addAttr -ci true -sn "scalePP" -ln "scalePP" -dt "vectorArray";
	addAttr -s false -ci true -sn "radiusPP" -ln "radiusPP" -dt "doubleArray";
	addAttr -ci true -h true -sn "radiusPP0" -ln "radiusPP0" -dt "doubleArray";
	addAttr -ci true -sn "instPP" -ln "instPP" -dt "doubleArray";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	addAttr -s false -ci true -sn "spriteTwistPP" -ln "spriteTwistPP" -dt "doubleArray";
	addAttr -ci true -h true -sn "spriteTwistPP0" -ln "spriteTwistPP0" -dt "doubleArray";
	addAttr -s false -ci true -sn "goalPP" -ln "goalPP" -dt "doubleArray";
	addAttr -ci true -h true -sn "goalPP0" -ln "goalPP0" -dt "doubleArray";
	addAttr -s false -ci true -h true -sn "goalPPCache" -ln "goalPPCache" -dt "doubleArray";
	addAttr -s false -ci true -sn "ageNormalized" -ln "ageNormalized" -dt "doubleArray";
	addAttr -ci true -h true -sn "ageNormalized0" -ln "ageNormalized0" -dt "doubleArray";
	addAttr -ci true -h true -sn "uValPP0" -ln "uValPP0" -dt "doubleArray";
	addAttr -s false -ci true -sn "uValPP" -ln "uValPP" -dt "doubleArray";
	addAttr -s false -ci true -sn "userScalar1PP" -ln "userScalar1PP" -dt "doubleArray";
	addAttr -ci true -h true -sn "userScalar1PP0" -ln "userScalar1PP0" -dt "doubleArray";
	addAttr -ci true -sn "aimUpPP" -ln "aimUpPP" -dt "vectorArray";
	addAttr -ci true -sn "aimAxisPP" -ln "aimAxisPP" -dt "vectorArray";
	addAttr -ci true -sn "spinPP" -ln "spinPP" -dt "doubleArray";
	addAttr -ci true -sn "visPP" -ln "visPP" -dt "doubleArray";
	addAttr -is true -ci true -sn "lineWidth" -ln "lineWidth" -dv 1 -min 1 -max 20 -at "long";
	addAttr -is true -ci true -sn "multiCount" -ln "multiCount" -dv 10 -min 1 -max 60 
		-at "long";
	addAttr -is true -ci true -sn "multiRadius" -ln "multiRadius" -dv 0.3 -min 0 -max 
		10 -at "float";
	addAttr -is true -ci true -sn "tailFade" -ln "tailFade" -min -1 -max 1 -at "float";
	addAttr -is true -ci true -sn "tailSize" -ln "tailSize" -dv 1 -min -100 -max 100 
		-at "float";
	addAttr -is true -ci true -sn "selectedOnly" -ln "selectedOnly" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -sn "attributeName" -ln "attributeName" -dt "string";
	addAttr -ci true -h true -sn "magVelPP0" -ln "magVelPP0" -dt "doubleArray";
	addAttr -s false -ci true -sn "magVelPP" -ln "magVelPP" -dt "doubleArray";
	addAttr -s false -ci true -sn "babyEmitterRatePP" -ln "babyEmitterRatePP" -dt "doubleArray";
	addAttr -ci true -h true -sn "babyEmitterRatePP0" -ln "babyEmitterRatePP0" -dt "doubleArray";
	addAttr -s false -ci true -h true -sn "babyEmitterRemainderPP" -ln "babyEmitterRemainderPP" 
		-dt "doubleArray";
	addAttr -ci true -h true -sn "babyEmitterRemainderPP0" -ln "babyEmitterRemainderPP0" 
		-dt "doubleArray";
	addAttr -s false -ci true -sn "rotationPP" -ln "rotationPP" -dt "vectorArray";
	addAttr -ci true -h true -sn "rotationPP0" -ln "rotationPP0" -dt "vectorArray";
	addAttr -s false -ci true -sn "angularVelocityPP" -ln "angularVelocityPP" -dt "vectorArray";
	addAttr -ci true -h true -sn "angularVelocityPP0" -ln "angularVelocityPP0" -dt "vectorArray";
	setAttr -k off ".v";
	setAttr -s 2 ".iog";
	setAttr ".gf" -type "Int32Array" 0 ;
	setAttr ".pos0" -type "vectorArray" 0 ;
	setAttr ".vel0" -type "vectorArray" 0 ;
	setAttr ".acc0" -type "vectorArray" 0 ;
	setAttr ".mas0" -type "doubleArray" 0 ;
	setAttr ".id0" -type "doubleArray" 0 ;
	setAttr ".nid" 800;
	setAttr ".bt0" -type "doubleArray" 0 ;
	setAttr ".ag0" -type "doubleArray" 0 ;
	setAttr ".lfm" 3;
	setAttr -s 25 ".xi";
	setAttr -s 12 ".xo";
	setAttr ".irbx" -type "string" (
		"vector $scalePP, $aimUpPP;\nfloat $inst, $add, $vis;\nvector $vel = .I[0];\nvector $pos = .I[1];\nfloat $scaleMulti = .I[2];\nfloat $id = .I[3];\nfloat $noise = `noise $id`;\nfloat $blink = .I[4];\nfloat $choice = .I[5];\nfloat $variety = .I[6];\nfloat $sRandom = .I[7];\nfloat $timeScale = .I[8];\nfloat $spinSpeed = .I[9];\nfloat $massRandom = .I[10];\nfloat $growFor = .I[11];\nfloat $twist = (.I[12]/ 180) * 3.1415;\nfloat $mass = .I[13] + ($noise * $massRandom);\nfloat $frame = frame;\nfloat $CTLsize = .I[14] + ($noise* $sRandom);\nfloat $lifespan = .I[15]+($noise*.I[16]);\nfloat $magVel = `mag $vel`;\nfloat $val =  $frame*($noise/(10+$magVel));\nfloat $ageNormal = .I[17];\nfloat $ageReverse = $ageNormal *-1+1;\nfloat $spin = .O[0];\nfloat $babyRate = $noise * $vel * .I[18];\nfloat $age = .I[19];\nfloat $growFade = `min 1 ($age / $growFor)`;\nfloat $grow = `smoothstep 0 1 $growFade`;\nfloat $size = .I[20] * $CTLsize * $grow;\n\nvector $aimVec = <<.I[21],.I[22],.I[23]>>;\n\nif (abs(.O[1] - $magVel) > .I[24]) $lifespan=0;\nif (`abs $noise` >= $variety){$inst=0;}else{$inst=1;}\n"
		+ "if (abs(`noise($id+(($frame%(3/$timeScale))-$frame))`)>$blink){$vis=1;}else{$vis=0;}\n\nif ($choice == 0){\t\t\n\tfloat $sin = `sin ($val+ $ageNormal)`;\n\tfloat $cos = `cos ($val+ $ageReverse)`;\n\tif ($inst){$sin = 1; $cos = 1;}\n\t$scalePP = <<$size, ($size*$sin), ($size*$cos)>>;\n\t$aimUpPP = <<0,(`cos $twist`),(`sin $twist`)>>;}\nif ($choice == 1 || $choice == 4){\n\t$spin += ($ageReverse*($noise*($spinSpeed*0.1)));\n\t$add  = `sin (($frame*$noise)/$lifespan)`* ($ageNormal);\n\t$scalePP = <<$size, ($size*$add), ($size*$add)>>*2;\n\t$aimUpPP = `rot <<0,1,0>> <<1,0,0>> ($spin+$twist)`;}\nif ($choice == 2){\n\t$aimUpPP = `rot <<0,1,0>> <<1,0,0>> ($spin+$twist)`;\n\tif (.I[19] > ($lifespan -0.2) && $inst==0){\n\t\t$size=$CTLsize*(`pow $ageNormal 3`);\n\t\tif (.I[19] >($lifespan-0.1)){$inst=2;}else{$inst=1;$size*=0.3;}\n\t\t$mass=0;\n\t\t$add = 1;\n\t\t$vis = 1;\n\t}else{\n\t\t$spin += ($noise*($spinSpeed*0.1));\t\t\n\t\t$add = ($ageNormal + ($noise*$inst));}\n\t$scalePP = <<$size, ($size*$add), ($size*$add)>>;\n}\nif ($choice == 3){\n\tif ($inst == 0){\n\t\t$inst = 3;\n\t\t$aimVec = `dnoise ($pos*0.3)`*$noise*45;\n"
		+ "\t\t$scalePP = <<$size,$size,$size>>;\n\t}\n\tif ($inst == 1){\n\t$scalePP = <<$size,$size,$size>>*0.5;\n\t}\n}\n\n.O[2] = $mass;\n.O[3] = $aimVec;\n.O[4] = $scalePP * $scaleMulti;\n.O[5] = $aimUpPP;\n.O[3] = $aimVec;\n.O[0] = $spin;\n.O[6] = $inst;\n.O[7] = $vis;\n.O[8] = $lifespan;\n.O[1] = $magVel;\n.O[9] = $babyRate;");
	setAttr ".irax" -type "string" "";
	setAttr ".icx" -type "string" "float $id = .I[3];\nfloat $speed = .I[9] * 90;\nfloat $weight = .I[6];\nfloat $lifespan = (.I[15] + (`noise $id` * .I[16]))*.I[8];\nfloat $val = .O[10] / 10;\nif ($val >= $weight){.O[6] = 0;}else{.O[6]=1;}\nvector $aimVec = <<.I[21],.I[22],.I[23]>>;\nfloat $spin = (`noise $id`*$speed);\n\n.O[3] = $aimVec;\n.O[5] = <<0,1,0>>;\n.O[11] = <<1,0,0>>;\n.O[0] = $spin;\n.O[10] = $id % 10;\n.O[7]=1;\n.O[8] = $lifespan;";
	setAttr ".cts" 106;
	setAttr ".gw[0]"  0;
	setAttr ".ga[0]" no;
	setAttr ".chw" 150;
	setAttr ".idt[0].iam" -type "stringArray" 18 "age" "age" "position" "worldPosition" "id" "particleId" "scale" "scalePP" "objectIndex" "instPP" "aimPosition" "aimPP" "aimAxis" "aimAxisPP" "aimUpAxis" "aimUpPP" "visibility" "visPP"  ;
	setAttr ".cofl" 1;
	setAttr ".cold" no;
	setAttr ".scld" no;
	setAttr -s 2 ".fsc[0:1]"  0 1 1 1 0 1;
	setAttr -s 2 ".pfdo[0:1]"  0 1 1 1 0 1;
	setAttr ".cprt" yes;
	setAttr ".vssc[0]"  0 1 1;
	setAttr ".stns[0]"  0 1 1;
	setAttr ".ra" 1;
	setAttr -s 4 ".rdc[0:3]"  0 1 1 1 0 1 0.45217392 0.38 3 0.9130435
		 0.25999999 3;
	setAttr ".rci" 2;
	setAttr ".mssc[0]"  0 1 0;
	setAttr ".msr" 0.1;
	setAttr ".pfsc[0]"  0 1 1;
	setAttr ".frsc[0]"  0 1 1;
	setAttr ".stsc[0]"  0 1 1;
	setAttr ".clsc[0]"  0 1 1;
	setAttr ".bosc[0]"  0 1 1;
	setAttr ".op" 0;
	setAttr ".opc[0]"  0 1 1;
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".inca[0].incap" 0;
	setAttr ".inca[0].incac" -type "float3" 0 0 0 ;
	setAttr ".inca[0].incai" 1;
	setAttr ".lifespanPP0" -type "doubleArray" 0 ;
	setAttr -k on ".lifespan";
	setAttr -k on ".colorAccum";
	setAttr -k on ".useLighting";
	setAttr -k on ".pointSize" 1;
	setAttr -k on ".normalDir";
	setAttr ".aimPP0" -type "vectorArray" 0 ;
	setAttr -k on ".typePP";
	setAttr -k on ".scalePP";
	setAttr ".radiusPP0" -type "doubleArray" 0 ;
	setAttr -k on ".instPP";
	setAttr ".nts" -type "string" "float $sRandom = CTL.sizeRandom;\n$id = shape.particleId;\nfloat $noise = `noise $id` * $sRandom;\nfloat $CTLsize = CTL.size + $noise;\nfloat $offset = shape.typePP;\nfloat $inst = shape.instPP;\nfloat $speed= $offset / 80;\nfloat $frame = frame;\nfloat $loc[] =`xform -q -a -ws -t aimLoc`;\nvector $aimVec = <<$loc[0], $loc[1], $loc[2]>>;\n\n/*\nvector $particlePos=shape.position;\nvector $aimToCamera = $particlePos - $aimVec;\nshape.aimPP = $aimToCamera;\n*/\n\nvector $normal = shape.goalWorldNormal0PP; \nfloat $myAngleBet[] = `angleBetween -euler -v1 1 0 0 -v2 ($normal.x) ($normal.y) ($normal.z)`; \nshape.aimPP = <<$myAngleBet[0]+rand(360),$myAngleBet[1], $myAngleBet[2]>>; \n\n\n$choice = CTL.type;\nfloat $size = shape.radiusPP * $CTLsize;\n\nif ($choice == 0){\nfloat $val = (($frame*$speed)+$offset);\nfloat $sin = `sin $val`;\nfloat $cos = `cos $val`;\nif ($inst){$sin = 1; $cos = 1;}\nshape.scalePP = <<$size, ($size*$sin), ($size*$cos)>>;}\nif ($choice == 1){\nshape.scalePP = <<$size, $size, $size>>;\n}\n";
	setAttr ".spriteTwistPP0" -type "doubleArray" 0 ;
	setAttr ".goalPP0" -type "doubleArray" 0 ;
	setAttr ".ageNormalized0" -type "doubleArray" 0 ;
	setAttr ".uValPP0" -type "doubleArray" 0 ;
	setAttr ".userScalar1PP0" -type "doubleArray" 0 ;
	setAttr -k on ".aimUpPP";
	setAttr -k on ".aimAxisPP";
	setAttr -k on ".spinPP";
	setAttr -k on ".visPP";
	setAttr ".attributeName" -type "string" "particleId";
	setAttr ".magVelPP0" -type "doubleArray" 0 ;
	setAttr ".babyEmitterRatePP0" -type "doubleArray" 0 ;
	setAttr ".babyEmitterRemainderPP0" -type "doubleArray" 0 ;
	setAttr ".rotationPP0" -type "vectorArray" 0 ;
	setAttr ".angularVelocityPP0" -type "vectorArray" 0 ;
createNode pointEmitter -n "emitB" -p "particleA";
	rename -uid "15C415D1-493A-7EC8-17F4-BFA26A32CB67";
	setAttr ".rat" 1;
	setAttr ".sro" no;
	setAttr ".urpp" yes;
	setAttr ".spd" 0;
createNode transform -n "particleB" -p "renderGP";
	rename -uid "0B56B0CA-4C33-C7AC-F458-0FB7930A23C8";
createNode nParticle -n "baby" -p "particleB";
	rename -uid "012CECDF-47CE-2A30-74B0-869E2EB2372C";
	addAttr -s false -ci true -sn "lifespanPP" -ln "lifespanPP" -dt "doubleArray";
	addAttr -ci true -h true -sn "lifespanPP0" -ln "lifespanPP0" -dt "doubleArray";
	addAttr -ci true -sn "lifespan" -ln "lifespan" -at "double";
	addAttr -is true -ci true -sn "colorAccum" -ln "colorAccum" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -sn "useLighting" -ln "useLighting" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -sn "pointSize" -ln "pointSize" -dv 2 -min 1 -max 60 -at "long";
	addAttr -is true -ci true -sn "normalDir" -ln "normalDir" -dv 2 -min 1 -max 3 -at "long";
	setAttr -k off ".v";
	setAttr ".gf" -type "Int32Array" 0 ;
	setAttr ".pos0" -type "vectorArray" 0 ;
	setAttr ".vel0" -type "vectorArray" 0 ;
	setAttr ".acc0" -type "vectorArray" 0 ;
	setAttr ".mas0" -type "doubleArray" 0 ;
	setAttr ".id0" -type "doubleArray" 0 ;
	setAttr ".nid" 538;
	setAttr ".bt0" -type "doubleArray" 0 ;
	setAttr ".ag0" -type "doubleArray" 0 ;
	setAttr ".lfm" 2;
	setAttr ".lfr" 1;
	setAttr ".irbx" -type "string" "";
	setAttr ".irax" -type "string" "";
	setAttr ".icx" -type "string" "$id = .I[0];\n$noise = `noise $id`;\n.O[0] = 1 - (abs($noise) * 0.2);";
	setAttr ".mxc" 50;
	setAttr ".inh" 0.1;
	setAttr ".cts" 106;
	setAttr ".chw" 150;
	setAttr ".cofl" 1;
	setAttr ".cold" no;
	setAttr ".scld" no;
	setAttr -s 2 ".fsc[0:1]"  0 1 1 1 0 1;
	setAttr -s 2 ".pfdo[0:1]"  0 1 1 1 0 1;
	setAttr ".vssc[0]"  0 1 1;
	setAttr ".stns[0]"  0 1 1;
	setAttr ".ra" 0.10000000149011612;
	setAttr ".rdc[0]"  0 1 1;
	setAttr ".mssc[0]"  0 1 1;
	setAttr ".pfsc[0]"  0 1 1;
	setAttr ".frsc[0]"  0 1 1;
	setAttr ".stsc[0]"  0 1 1;
	setAttr ".clsc[0]"  0 1 1;
	setAttr ".bosc[0]"  0 1 1;
	setAttr ".opc[0]"  0 1 1;
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".inca[0].incap" 0;
	setAttr ".inca[0].incac" -type "float3" 0 0 0 ;
	setAttr ".inca[0].incai" 1;
	setAttr ".lifespanPP0" -type "doubleArray" 0 ;
	setAttr -k on ".lifespan" 2;
	setAttr -k on ".colorAccum";
	setAttr -k on ".useLighting";
	setAttr -k on ".pointSize";
	setAttr -k on ".normalDir";
createNode pointEmitter -n "emitC" -p "particleB";
	rename -uid "EC0C8691-43F9-4D4A-9F20-73893A49B0B9";
	setAttr ".sro" no;
	setAttr ".srs" yes;
	setAttr -l on ".urpp";
	setAttr ".spd" 0.1;
	setAttr ".srnd" 0.1;
createNode transform -n "particleC" -p "renderGP";
	rename -uid "145C579B-426B-0518-1A75-36AE4F5FA00F";
createNode nParticle -n "twinkles" -p "particleC";
	rename -uid "BB226C03-43BC-BF14-4A85-D5945EC9F418";
	addAttr -s false -ci true -sn "lifespanPP" -ln "lifespanPP" -dt "doubleArray";
	addAttr -ci true -h true -sn "lifespanPP0" -ln "lifespanPP0" -dt "doubleArray";
	addAttr -ci true -sn "lifespan" -ln "lifespan" -at "double";
	addAttr -is true -ci true -sn "colorAccum" -ln "colorAccum" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -sn "useLighting" -ln "useLighting" -min 0 -max 1 -at "bool";
	addAttr -is true -ci true -sn "pointSize" -ln "pointSize" -dv 2 -min 1 -max 60 -at "long";
	addAttr -is true -ci true -sn "normalDir" -ln "normalDir" -dv 2 -min 1 -max 3 -at "long";
	setAttr -k off ".v";
	setAttr ".gf" -type "Int32Array" 0 ;
	setAttr ".pos0" -type "vectorArray" 0 ;
	setAttr ".vel0" -type "vectorArray" 0 ;
	setAttr ".acc0" -type "vectorArray" 0 ;
	setAttr ".mas0" -type "doubleArray" 0 ;
	setAttr ".id0" -type "doubleArray" 0 ;
	setAttr ".nid" 454;
	setAttr ".bt0" -type "doubleArray" 0 ;
	setAttr ".ag0" -type "doubleArray" 0 ;
	setAttr ".lfm" 2;
	setAttr ".lfr" 0.8;
	setAttr ".irbx" -type "string" "";
	setAttr ".irax" -type "string" "";
	setAttr ".icx" -type "string" "";
	setAttr ".inh" 0.8;
	setAttr ".cts" 106;
	setAttr ".chw" 150;
	setAttr ".cofl" 1;
	setAttr ".pmss" 0.10000000149011612;
	setAttr ".cold" no;
	setAttr ".scld" no;
	setAttr -s 2 ".fsc[0:1]"  0 1 1 1 0 1;
	setAttr -s 2 ".pfdo[0:1]"  0 1 1 1 0 1;
	setAttr ".visc" 100;
	setAttr ".vssc[0]"  0 1 1;
	setAttr ".stns[0]"  0 1 1;
	setAttr ".rdns" 100;
	setAttr ".ra" 0.10000000149011612;
	setAttr ".rdc[0]"  0 1 1;
	setAttr ".mssc[0]"  0 1 1;
	setAttr ".pfsc[0]"  0 1 1;
	setAttr ".frsc[0]"  0 1 1;
	setAttr ".stsc[0]"  0 1 1;
	setAttr ".clsc[0]"  0 1 1;
	setAttr ".bosc[0]"  0 1 1;
	setAttr ".opc[0]"  0 1 1;
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".inca[0].incap" 0;
	setAttr ".inca[0].incac" -type "float3" 0 0 0 ;
	setAttr ".inca[0].incai" 1;
	setAttr ".lifespanPP0" -type "doubleArray" 0 ;
	setAttr -k on ".lifespan" 2;
	setAttr -k on ".colorAccum";
	setAttr -k on ".useLighting";
	setAttr -k on ".pointSize";
	setAttr -k on ".normalDir";
createNode transform -n "setupGP" -p "root";
	rename -uid "45B0AA08-43D1-3AFF-C9D6-28A97AF3A144";
createNode transform -n "guts_GP" -p "setupGP";
	rename -uid "4D65900D-40DB-F552-4B86-70948B2F6909";
createNode nucleus -n "nuke" -p "guts_GP";
	rename -uid "3C3D9176-4458-5E65-6CE1-258D5CD42748";
	setAttr -s 2 ".niao";
	setAttr -s 2 ".nias";
	setAttr -s 2 ".noao";
createNode nucleus -n "nukeB" -p "guts_GP";
	rename -uid "CF19D636-4794-4B07-68E6-8D8C821DD598";
createNode transform -n "ball" -p "guts_GP";
	rename -uid "DFC811AF-4A28-79D8-5E72-5AA301CC3D15";
createNode mesh -n "ballShape" -p "ball";
	rename -uid "6A2FD86C-4935-3E8B-A8B7-F8A49BF14D30";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".dr" 3;
	setAttr ".dsm" 2;
createNode transform -n "basicStar" -p "guts_GP";
	rename -uid "57509B2D-4A73-7D23-CB29-C08C4550E560";
	setAttr ".t" -type "double3" 1.9861426834497791e-016 0 0 ;
createNode mesh -n "basicShape" -p "basicStar";
	rename -uid "EA69FC7E-47E3-9ADF-B47C-4E891A205F92";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.48809522390365601 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 9 ".uvst[0].uvsp[0:8]" -type "float2" 0 0 0.5 0 1 0 0 0.48809522
		 0.5 0.48809522 1 0.48809522 0 0.97619045 0.5 0.97619045 1 0.97619045;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 9 ".vt[0:8]"  -1.7179549e-017 -0.075527728 0.077369809
		 0 -2.38896966 0 1.7179549e-017 -0.075527728 -0.077369809 -5.1274854e-016 0 2.30921412
		 0 0 0 5.1274854e-016 0 -2.30921412 -1.7179549e-017 0.075527728 0.077369809 0 2.38896966 0
		 1.7179549e-017 0.075527728 -0.077369809;
	setAttr -s 16 ".ed[0:15]"  0 1 0 0 3 0 1 2 0 1 4 1 2 5 0 3 4 1 3 6 0
		 4 5 1 4 7 1 5 8 0 6 7 0 7 8 0 4 0 1 2 4 1 4 6 1 8 4 1;
	setAttr -s 8 -ch 24 ".fc[0:7]" -type "polyFaces" 
		f 3 3 12 0
		mu 0 3 1 4 0
		f 3 -13 -6 -2
		mu 0 3 0 4 3
		f 3 2 13 -4
		mu 0 3 1 2 4
		f 3 -14 4 -8
		mu 0 3 4 2 5
		f 3 5 14 -7
		mu 0 3 3 4 6
		f 3 -15 8 -11
		mu 0 3 6 4 7
		f 3 9 15 7
		mu 0 3 5 8 4
		f 3 -16 -12 -9
		mu 0 3 4 8 7;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "star" -p "guts_GP";
	rename -uid "E4F94E0A-4540-7667-3CFB-B2B5F26C716E";
createNode mesh -n "starShape" -p "star";
	rename -uid "75735234-4BC1-9FFC-DA9A-6FA905397F42";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "blink" -p "guts_GP";
	rename -uid "13F9F476-49AF-1DBD-1DE4-1DB6B0F4D2BF";
createNode mesh -n "blinkShape" -p "blink";
	rename -uid "278E4E9F-43B6-0AB5-EEAA-EC882B059748";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" -0.71065649390220642 -0.75436919927597046 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 146 ".uvst[0].uvsp[0:145]" -type "float2" 0.92119354 1 0 0.0037101398
		 0.029539274 0 1 0.9435932 0.32104027 0.35092181 0.3904531 0.35092181 0.31359237 0.34286678
		 0.31359237 0.276189 0.66348338 0.72128111 0.77135783 0.72128111 0.65679622 0.7140488
		 0.65679622 0.60989112 -2.34711695 1.0065984726 -1.42387712 0.012516922 -1.420439
		 0.044393446 -2.29484606 1.091640353 -1.7456305 0.35895899 -1.7456305 0.43386403 -2.082132339
		 0.72128111 -1.98561168 0.72128111 -2.088834286 0.72849739 -2.088834286 0.84490728
		 -1.73816609 0.35092181 -1.6763773 0.35092181 -2.35323167 -2.52031207 -1.43203807
		 -1.52402222 -1.46157742 -1.52031207 -2.43203807 -2.46390533 -1.75307834 -1.87123394
		 -1.82249117 -1.87123394 -2.09552145 -2.24159312 -2.20339608 -2.24159312 -2.088834286
		 -2.23436093 -2.088834286 -2.13020325 -1.7456305 -1.86317885 -1.7456305 -1.79650104
		 0.91507888 -2.52691054 -0.0081610521 -1.53282905 -0.011599157 -1.56470549 0.86280793
		 -2.61195254 0.30612794 -1.87123394 0.24433912 -1.87123394 0.31359237 -1.87927103
		 0.31359237 -1.95417607 0.65009415 -2.24159312 0.55357355 -2.24159312 0.65679622 -2.24880958
		 0.65679622 -2.36521935 -0.89473981 -0.76015604 -0.53729832 -0.76015604 -0.71601903
		 -0.95301777 -0.71601903 -0.5672943 -0.55920297 -0.66756624 -0.87283516 -0.66756624
		 -0.63021809 -0.92937994 -0.63021809 -0.66756624 -0.84002358 -0.89904076 -0.63021809
		 -0.89904076 -0.73746932 -0.95164299 -0.73746932 -0.89904076 -0.7910949 -0.93522722
		 -0.7910949 -0.89904076 -0.80415273 -0.92797512 -0.7910949 -0.92797512 -0.81790769
		 -0.91862744 -0.81790769 -0.89904076 -0.73746932 -0.92797512 -0.76428211 -0.94590342
		 -0.76428211 -0.92797512 -0.76428211 -0.89904076 -0.68384373 -0.94990069 -0.68384373
		 -0.89904076 -0.63021809 -0.92797512 -0.68384373 -0.92797512 -0.65703088 -0.94226563
		 -0.65703088 -0.92797512 -0.65703088 -0.89904076 -0.84472048 -0.89397222 -0.84472048
		 -0.66756624 -0.89346582 -0.7833035 -0.84472048 -0.7833035 -0.8782537 -0.84117216
		 -0.84472048 -0.84117216 -0.86287105 -0.87010646 -0.84472048 -0.87010646 -0.87153327
		 -0.85526317 -0.87153327 -0.84117216 -0.88814712 -0.8122378 -0.84472048 -0.8122378
		 -0.87153327 -0.8122378 -0.87153327 -0.7833035 -0.84472048 -0.72543484 -0.89185125
		 -0.72543484 -0.84472048 -0.69650054 -0.884776 -0.69650054 -0.87153327 -0.69650054
		 -0.87153327 -0.72543484 -0.87153327 -0.66756624 -0.59201455 -0.89904076 -0.53857231
		 -0.7833035 -0.63021809 -0.7833035 -0.56586742 -0.86479878 -0.56586742 -0.7833035
		 -0.55378443 -0.84117216 -0.56586742 -0.84117216 -0.54389101 -0.8122378 -0.56586742
		 -0.8122378 -0.54977971 -0.83110499 -0.54977971 -0.8122378 -0.54977971 -0.7833035
		 -0.56586742 -0.66756624 -0.54018682 -0.72543484 -0.56586742 -0.72543484 -0.54726213
		 -0.69650054 -0.56586742 -0.69650054 -0.54977971 -0.69650054 -0.54977971 -0.72543484
		 -0.54977971 -0.68920708 -0.63021809 -0.59093213 -0.84472048 -0.62633991 -0.81298918
		 -0.59812385 -0.63021809 -0.59812385 -0.73746932 -0.66756624 -0.73746932 -0.59812385
		 -0.73746932 -0.56866914 -0.7910949 -0.58508486 -0.7910949 -0.59812385 -0.78176594
		 -0.58076328 -0.73746932 -0.58076328 -0.76428211 -0.59812385 -0.76428211 -0.58076328
		 -0.76428211 -0.57440865 -0.68384373 -0.57041138 -0.68384373 -0.59812385 -0.65027219
		 -0.58076328 -0.68384373 -0.58076328 -0.65703088 -0.58076328 -0.65703088 -0.59812385
		 -0.65703088 -0.57804644 -0.61904895 -0.59812385 -0.56586742 -0.65551329 -0.58176738
		 -0.63284504 -0.63021809 -0.63284504 -0.59804273 -0.63284504 -0.59804273 -0.66756624
		 -0.59804273 -0.61528194;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 146 ".pt[0:145]" -type "float3"  1.3184982e-016 2.2458568 
		2.4359455 5.8185797e-017 0.98253751 1.0574781 6.3694853e-017 1.0250578 1.0543506 
		1.5065176e-016 2.3619168 2.365869 8.3858042e-017 1.4228103 1.5378803 9.6034074e-017 
		1.5222349 1.5421035 8.3262472e-017 1.4125961 1.5267354 8.9147074e-017 1.4163554 1.438231 
		1.112418e-016 1.8924344 2.0503099 1.3016459e-016 2.0469508 2.0568731 1.1070703e-016 
		1.8832636 2.0403035 1.1989941e-016 1.8891361 1.90205 -4.4204241e-016 -2.4359455 2.2458568 
		-1.9236047e-016 -1.0574781 0.98253751 -1.9457065e-016 -1.0543506 1.0250578 -4.4037862e-016 
		-2.365869 2.3619168 -2.7937582e-016 -1.5378803 1.4228103 -2.8598649e-016 -1.5421035 
		1.5222349 -3.7037969e-016 -2.0403035 1.8832636 -3.5344856e-016 -1.90205 1.8891361 
		-3.7219215e-016 -2.0503099 1.8924344 -3.8246587e-016 -2.0568731 2.0469508 -2.7735713e-016 
		-1.5267354 1.4125961 -2.6651844e-016 -1.438231 1.4163554 -1.3184982e-016 -2.2458568 
		-2.4359455 -5.8185797e-017 -0.98253751 -1.0574781 -6.3694853e-017 -1.0250578 -1.0543506 
		-1.5065176e-016 -2.3619168 -2.365869 -8.3858042e-017 -1.4228103 -1.5378803 -9.6034074e-017 
		-1.5222349 -1.5421035 -1.112418e-016 -1.8924344 -2.0503099 -1.3016459e-016 -2.0469508 
		-2.0568731 -1.1070703e-016 -1.8832636 -2.0403035 -1.1989941e-016 -1.8891361 -1.90205 
		-8.3262472e-017 -1.4125961 -1.5267354 -8.9147074e-017 -1.4163554 -1.438231 4.4204241e-016 
		2.4359455 -2.2458568 1.9236047e-016 1.0574781 -0.98253751 1.9457065e-016 1.0543506 
		-1.0250578 4.4037862e-016 2.365869 -2.3619168 2.7735713e-016 1.5267354 -1.4125961 
		2.6651844e-016 1.438231 -1.4163554 2.7937582e-016 1.5378803 -1.4228103 2.8598649e-016 
		1.5421035 -1.5222349 3.7037969e-016 2.0403035 -1.8832636 3.5344856e-016 1.90205 -1.8891361 
		3.7219215e-016 2.0503099 -1.8924344 3.8246587e-016 2.0568731 -2.0469508 -3.1350254e-017 
		-0.25599423 -0.010873565 3.1350254e-017 0.25599423 0.010873565 1.7020889e-017 0.010873565 
		-0.25599423 -1.7020889e-017 -0.010873565 0.25599423 1.9336399e-017 0.21939844 0.13243957 
		-3.5679307e-017 -0.22983889 0.11335786 2.9985496e-017 0.13243957 -0.21939844 4.5779533e-018 
		0.082370676 0.089692578 -9.4950342e-018 -0.16978998 -0.19189264 2.3314906e-017 0.1233464 
		-0.13161027 1.3136866e-017 -0.019928629 -0.25547442 1.008271e-017 -0.012715548 -0.19383484 
		2.2813846e-018 -0.097665846 -0.23694772 1.0145087e-018 -0.090052202 -0.20244652 -6.4918267e-019 
		-0.11677837 -0.22811608 2.1400873e-018 -0.086044826 -0.2125019 -3.8869779e-018 -0.13700759 
		-0.21654539 -4.0170773e-018 -0.12689857 -0.19510795 9.5491963e-018 -0.027115878 -0.21379139 
		7.9269678e-018 -0.058658071 -0.24948743 6.0924247e-018 -0.056057148 -0.2159999 5.6075666e-018 
		-0.048612434 -0.1940843 2.2389824e-017 0.056784838 -0.24989921 1.6371868e-017 0.043814201 
		-0.18135469 2.4764553e-017 0.11230554 -0.17716834 1.9777806e-017 0.060292643 -0.20229962 
		2.6419356e-017 0.094760224 -0.23813349 2.2337687e-017 0.085864894 -0.19183187 2.0250344e-017 
		0.082961291 -0.16441709 -1.0766272e-017 -0.17680351 -0.18545066 -2.4708952e-017 -0.14160542 
		0.11175056 -2.9083909e-017 -0.2528643 -0.04152073 -2.2426071e-017 -0.19206934 -0.029096661 
		-2.1308325e-017 -0.22781233 -0.11740691 -1.7842392e-017 -0.19408739 -0.10688919 -1.6056401e-017 
		-0.20414737 -0.15487686 -1.4303427e-017 -0.18364929 -0.14298192 -1.8885873e-017 -0.21739179 
		-0.13570167 -1.9320697e-017 -0.20444587 -0.10374941 -2.5597352e-017 -0.24361467 -0.079602987 
		-1.9888039e-017 -0.18927389 -0.064885341 -2.1896568e-017 -0.21047486 -0.074165724 
		-2.3731813e-017 -0.21073011 -0.04513992 -2.4998325e-017 -0.18442875 0.028288703 -3.390786e-017 
		-0.2538144 0.035389196 -2.5757996e-017 -0.17087069 0.068730064 -3.5220331e-017 -0.24531132 
		0.074225515 -2.919223e-017 -0.19843015 0.069295928 -2.8614493e-017 -0.20669189 0.042928241 
		-2.9315827e-017 -0.18606061 0.096883863 3.4009399e-017 0.18545066 -0.17680351 3.3169635e-017 
		0.25547442 -0.019928629 1.6734009e-017 0.12646724 -0.018297547 3.5573997e-017 0.22097254 
		-0.12976173 2.3187026e-017 0.18000616 -0.014142168 3.5608368e-017 0.23694772 -0.097665846 
		3.2128198e-017 0.21337846 -0.090318993 3.479024e-017 0.24948743 -0.058658071 2.8965307e-017 
		0.20579378 -0.054632325 3.5422388e-017 0.24211638 -0.084059641 3.0927545e-017 0.22150874 
		-0.0542758 2.871897e-017 0.21597029 -0.029694118 1.573992e-017 0.18362777 0.11616959 
		2.7779266e-017 0.24989921 0.056784838 2.133607e-017 0.1916326 0.040175065 2.3984583e-017 
		0.23813349 0.094760224 1.9619958e-017 0.19747803 0.080969714 2.1723191e-017 0.21468458 
		0.082227595 2.3278403e-017 0.21612848 0.059609111 2.2899279e-017 0.23411615 0.104288 
		1.1600577e-019 0.11335786 0.22983889 -3.4385987e-017 -0.19189264 0.16978998 -3.1310037e-017 
		-0.1480325 0.20917299 6.1328959e-019 0.10017283 0.19282375 -1.1439378e-017 -0.028967777 
		0.12447104 -1.4762869e-017 -0.029366709 0.17816886 -2.0662244e-017 -0.04152073 0.2528643 
		-2.8620204e-017 -0.11740691 0.22781233 -2.6140085e-017 -0.10809274 0.20495547 -2.736516e-017 
		-0.104288 0.23411615 -1.9110215e-017 -0.047907475 0.21268016 -2.1366881e-017 -0.071893297 
		0.20042597 -2.2430018e-017 -0.072869577 0.21611357 -2.4859064e-017 -0.079602987 0.24361467 
		-1.110176e-017 0.035389196 0.2538144 -9.0898687e-018 0.023770038 0.19435847 -4.2992262e-018 
		0.084059641 0.24211638 -8.4534955e-018 0.041060846 0.22041044 -5.6397538e-018 0.063720837 
		0.22088926 -4.5872194e-018 0.063924916 0.20363955 -5.7245713e-018 0.074225515 0.24531132 
		2.7099452e-018 0.12976173 0.22097254 1.7103642e-017 0.20917299 0.1480325 1.231397e-017 
		0.18512027 0.17715375 4.5347596e-018 0.1100083 0.14847457 8.2085996e-018 0.14258942 
		0.15524743 9.7176905e-018 0.13860297 0.12221006 7.9090138e-018 0.16081773 0.19947585;
	setAttr -s 146 ".vt[0:145]"  -1.8835689e-016 -3.20836663 -3.47992229 -8.3122566e-017 -1.40362501 -1.51068294
		 -9.0992647e-017 -1.46436822 -1.5062151 -2.1521679e-016 -3.37416673 -3.37981296 -1.1979721e-016 -2.032586098 -2.19697189
		 -1.3719153e-016 -2.17462134 -2.20300508 -1.1894639e-016 -2.017994404 -2.18105054
		 -1.2735297e-016 -2.023364782 -2.054615736 -1.5891685e-016 -2.70347762 -2.92901421
		 -1.8594941e-016 -2.92421532 -2.93839002 -1.5815291e-016 -2.69037652 -2.9147191 -1.7128487e-016 -2.69876575 -2.71721435
		 6.3148916e-016 3.47992229 -3.20836663 2.7480068e-016 1.51068294 -1.40362501 2.7795807e-016 1.5062151 -1.46436822
		 6.2911233e-016 3.37981296 -3.37416673 3.9910829e-016 2.19697189 -2.032586098 4.0855213e-016 2.20300508 -2.17462134
		 5.2911385e-016 2.9147191 -2.69037652 5.049265e-016 2.71721435 -2.69876575 5.3170307e-016 2.92901421 -2.70347762
		 5.4637982e-016 2.93839002 -2.92421532 3.9622446e-016 2.18105054 -2.017994404 3.8074065e-016 2.054615736 -2.023364782
		 1.8835689e-016 3.20836663 3.47992229 8.3122566e-017 1.40362501 1.51068294 9.0992647e-017 1.46436822 1.5062151
		 2.1521679e-016 3.37416673 3.37981296 1.1979721e-016 2.032586098 2.19697189 1.3719153e-016 2.17462134 2.20300508
		 1.5891685e-016 2.70347762 2.92901421 1.8594941e-016 2.92421532 2.93839002 1.5815291e-016 2.69037652 2.9147191
		 1.7128487e-016 2.69876575 2.71721435 1.1894639e-016 2.017994404 2.18105054 1.2735297e-016 2.023364782 2.054615736
		 -6.3148916e-016 -3.47992229 3.20836663 -2.7480068e-016 -1.51068294 1.40362501 -2.7795807e-016 -1.5062151 1.46436822
		 -6.2911233e-016 -3.37981296 3.37416673 -3.9622446e-016 -2.18105054 2.017994404 -3.8074065e-016 -2.054615736 2.023364782
		 -3.9910829e-016 -2.19697189 2.032586098 -4.0855213e-016 -2.20300508 2.17462134 -5.2911385e-016 -2.9147191 2.69037652
		 -5.049265e-016 -2.71721435 2.69876575 -5.3170307e-016 -2.92901421 2.70347762 -5.4637982e-016 -2.93839002 2.92421532
		 4.478608e-017 0.36570606 0.015533663 -4.478608e-017 -0.36570606 -0.015533663 -2.4315555e-017 -0.015533663 0.36570606
		 2.4315555e-017 0.015533663 -0.36570606 -2.7623427e-017 -0.31342635 -0.18919939 5.0970439e-017 0.32834128 -0.1619398
		 -4.2836425e-017 -0.18919939 0.31342635 -6.5399335e-018 -0.11767239 -0.12813225 1.3564334e-017 0.24255712 0.27413234
		 -3.330701e-017 -0.17620915 0.18801469 -1.8766951e-017 0.028469469 0.36496347 -1.4403871e-017 0.018165069 0.27690691
		 -3.259121e-018 0.13952264 0.33849674 -1.4492982e-018 0.128646 0.28920931 9.2740378e-019 0.16682623 0.32588011
		 -3.0572676e-018 0.12292118 0.30357414 5.5528254e-018 0.19572513 0.30935055 5.7386821e-018 0.18128368 0.27872565
		 -1.3641709e-017 0.038736969 0.30541626 -1.1324239e-017 0.083797246 0.35641062 -8.7034637e-018 0.080081642 0.30857128
		 -8.0108091e-018 0.069446333 0.27726328 -3.1985463e-017 -0.081121199 0.35699886 -2.3388383e-017 -0.062591717 0.25907812
		 -3.5377932e-017 -0.1604365 0.25309762 -2.8254008e-017 -0.086132348 0.28899947 -3.7741939e-017 -0.13537174 0.34019071
		 -3.191098e-017 -0.12266413 0.27404553 -2.8929064e-017 -0.11851612 0.23488155 1.5380388e-017 0.25257644 0.2649295
		 3.5298503e-017 0.20229346 -0.15964365 4.1548442e-017 0.36123472 0.059315328 3.2037244e-017 0.27438477 0.041566659
		 3.0440465e-017 0.32544619 0.16772416 2.5489132e-017 0.27726769 0.15269884 2.2937717e-017 0.29163909 0.22125266
		 2.0433467e-017 0.26235613 0.20425987 2.6979819e-017 0.31055969 0.19385953 2.7600997e-017 0.29206553 0.14821345
		 3.6567646e-017 0.34802097 0.11371855 2.8411484e-017 0.27039129 0.092693344 3.1280811e-017 0.30067837 0.10595103
		 3.390259e-017 0.301043 0.064485602 3.5711892e-017 0.26346964 -0.040412433 4.8439799e-017 0.36259198 -0.050555993
		 3.6797136e-017 0.24410099 -0.098185807 5.031476e-017 0.35044473 -0.10603645 4.1703187e-017 0.28347164 -0.098994181
		 4.0877846e-017 0.29527414 -0.06132606 4.1879754e-017 0.26580086 -0.13840552 -4.8584854e-017 -0.2649295 0.25257644
		 -4.7385194e-017 -0.36496347 0.028469469 -2.3905726e-017 -0.18066749 0.026139352 -5.0819995e-017 -0.31567505 0.18537389
		 -3.3124322e-017 -0.25715166 0.020203097 -5.08691e-017 -0.33849674 0.13952264 -4.5897427e-017 -0.30482638 0.12902713
		 -4.9700343e-017 -0.35641062 0.083797246 -4.1379009e-017 -0.29399112 0.07804618 -5.0603413e-017 -0.34588054 0.1200852
		 -4.4182208e-017 -0.31644106 0.077536859 -4.10271e-017 -0.30852899 0.042420167 -2.2485601e-017 -0.26232538 -0.16595656
		 -3.9684668e-017 -0.35699886 -0.081121199 -3.04801e-017 -0.27376086 -0.057392951 -3.426369e-017 -0.34019071 -0.13537174
		 -2.8028512e-017 -0.28211147 -0.11567102 -3.103313e-017 -0.30669224 -0.11746799 -3.3254861e-017 -0.30875498 -0.085155874
		 -3.2713256e-017 -0.33445165 -0.14898287 -1.6572253e-019 -0.1619398 -0.32834128 4.9122839e-017 0.27413234 -0.24255712
		 4.4728624e-017 0.211475 -0.29881856 -8.7612799e-019 -0.14310403 -0.27546251 1.6341969e-017 0.04138254 -0.17781577
		 2.1089813e-017 0.041952442 -0.25452694 2.951749e-017 0.059315328 -0.36123472 4.0886006e-017 0.16772416 -0.32544619
		 3.7342979e-017 0.1544182 -0.29279354 3.9093085e-017 0.14898287 -0.33445165 2.7300307e-017 0.068439253 -0.30382881
		 3.0524116e-017 0.10270471 -0.2863228 3.2042883e-017 0.10409939 -0.30873367 3.5512948e-017 0.11371855 -0.34802097
		 1.5859656e-017 -0.050555993 -0.36259198 1.2985527e-017 -0.033957198 -0.27765495 6.1417515e-018 -0.1200852 -0.34588054
		 1.2076422e-017 -0.05865835 -0.31487206 8.0567913e-018 -0.091029771 -0.31555608 6.5531709e-018 -0.091321312 -0.29091364
		 8.1779592e-018 -0.10603645 -0.35044473 -3.8713504e-018 -0.18537389 -0.31567505 -2.4433774e-017 -0.29881856 -0.211475
		 -1.7591385e-017 -0.26445752 -0.25307679 -6.4782279e-018 -0.15715471 -0.21210653 -1.1726571e-017 -0.20369917 -0.22178204
		 -1.3882415e-017 -0.19800425 -0.1745858 -1.1298591e-017 -0.22973961 -0.28496552;
	setAttr -s 218 ".ed";
	setAttr ".ed[0:165]"  0 8 0 8 9 1 9 3 0 3 0 0 4 6 0 6 7 1 7 5 0 5 4 1 6 1 0
		 1 2 0 2 7 0 8 10 0 10 11 1 11 9 0 10 4 0 5 11 0 16 22 0 22 23 1 23 17 0 17 16 1 20 18 0
		 18 19 1 19 21 0 21 20 1 18 16 0 17 19 0 12 20 0 21 15 0 15 12 0 22 13 0 13 14 0 14 23 0
		 34 25 0 25 26 0 26 35 0 35 34 1 32 28 0 28 29 1 29 33 0 33 32 1 24 30 0 30 31 1 31 27 0
		 27 24 0 30 32 0 33 31 0 28 34 0 35 29 0 40 37 0 37 38 0 38 41 0 41 40 1 44 42 0 42 43 1
		 43 45 0 45 44 1 42 40 0 41 43 0 36 46 0 46 47 1 47 39 0 39 36 0 46 44 0 45 47 0 139 118 0
		 118 121 1 121 139 1 113 117 0 117 115 1 115 113 1 77 56 0 56 65 1 65 61 1 61 69 1
		 69 59 1 59 71 1 71 76 1 76 57 1 57 100 1 100 55 1 55 122 1 122 78 1 78 93 1 93 91 1
		 91 80 1 80 88 1 88 82 1 82 84 1 84 77 1 72 57 1 76 75 1 75 72 1 66 59 1 69 68 1 68 66 1
		 64 62 0 62 63 1 63 61 1 65 64 1 62 60 0 60 63 1 56 64 0 67 58 0 58 66 1 68 67 1 60 67 0
		 68 63 1 58 50 0 50 70 0 70 73 1 73 71 1 74 54 0 54 72 1 75 74 1 70 74 0 75 73 1 78 97 1
		 97 95 1 95 93 1 89 88 1 80 90 1 90 89 1 85 83 0 83 84 1 82 86 1 86 85 1 83 77 0 81 85 0
		 86 81 1 89 86 1 87 81 0 89 87 1 79 87 0 90 79 1 48 79 0 91 96 1 96 92 1 92 48 0 95 96 1
		 95 94 1 94 92 0 97 53 1 53 94 0 54 98 0 98 57 1 105 99 0 99 109 1 109 108 1 108 105 1
		 98 101 0 101 104 1 104 106 1 106 102 1 102 100 1 101 103 0 103 104 1 107 105 0 108 107 1
		 103 107 0 108 106 1 109 102 1 110 144 1 144 55 1 102 112 1 112 114 1 114 110 1;
	setAttr ".ed[166:217]" 99 49 0 49 111 0 111 116 1 116 112 1 111 113 0 115 116 1
		 115 114 1 117 52 0 52 110 1 134 138 0 138 136 1 136 134 1 119 53 0 78 119 1 55 142 1
		 142 121 1 121 137 1 137 133 1 133 123 1 123 122 1 120 119 0 123 129 1 129 126 1 126 120 1
		 124 131 0 131 130 1 130 128 1 128 124 1 125 120 0 126 125 1 123 128 1 130 129 1 127 125 0
		 130 127 1 131 127 0 132 51 0 51 124 0 133 135 1 135 132 1 118 134 0 136 137 1 136 135 1
		 138 132 0 52 140 0 140 110 1 141 145 0 145 143 1 143 141 1 140 141 0 143 144 1 143 142 1
		 145 139 0;
	setAttr -s 77 -ch 342 ".fc[0:76]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 8 9 3
		f 4 4 5 6 7
		mu 0 4 4 6 7 5
		f 4 8 9 10 -6
		mu 0 4 6 1 2 7
		f 4 11 12 13 -2
		mu 0 4 8 10 11 9
		f 4 14 -8 15 -13
		mu 0 4 10 4 5 11
		f 4 16 17 18 19
		mu 0 4 16 22 23 17
		f 4 20 21 22 23
		mu 0 4 20 18 19 21
		f 4 24 -20 25 -22
		mu 0 4 18 16 17 19
		f 4 26 -24 27 28
		mu 0 4 12 20 21 15
		f 4 29 30 31 -18
		mu 0 4 22 13 14 23
		f 4 32 33 34 35
		mu 0 4 34 25 26 35
		f 4 36 37 38 39
		mu 0 4 32 28 29 33
		f 4 40 41 42 43
		mu 0 4 24 30 31 27
		f 4 44 -40 45 -42
		mu 0 4 30 32 33 31
		f 4 46 -36 47 -38
		mu 0 4 28 34 35 29
		f 4 48 49 50 51
		mu 0 4 40 37 38 41
		f 4 52 53 54 55
		mu 0 4 44 42 43 45
		f 4 56 -52 57 -54
		mu 0 4 42 40 41 43
		f 4 58 59 60 61
		mu 0 4 36 46 47 39
		f 4 62 -56 63 -60
		mu 0 4 46 44 45 47
		f 3 64 65 66
		mu 0 3 139 118 121
		f 3 67 68 69
		mu 0 3 113 117 115
		f 19 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88
		mu 0 19 77 56 65 61 69 59 71 76 57 100 55 122 78 93 91 80 88 82 84
		f 4 89 -78 90 91
		mu 0 4 72 57 76 75
		f 4 92 -75 93 94
		mu 0 4 66 59 69 68
		f 5 95 96 97 -73 98
		mu 0 5 64 62 63 61 65
		f 3 99 100 -97
		mu 0 3 62 60 63
		f 3 101 -99 -72
		mu 0 3 56 64 65
		f 4 102 103 -95 104
		mu 0 4 67 58 66 68
		f 4 105 -105 106 -101
		mu 0 4 60 67 68 63
		f 4 -74 -98 -107 -94
		mu 0 4 69 61 63 68
		f 7 107 108 109 110 -76 -93 -104
		mu 0 7 58 50 70 73 71 59 66
		f 4 111 112 -92 113
		mu 0 4 74 54 72 75
		f 4 114 -114 115 -110
		mu 0 4 70 74 75 73
		f 4 -77 -111 -116 -91
		mu 0 4 76 71 73 75
		f 4 -83 116 117 118
		mu 0 4 93 78 97 95
		f 4 119 -86 120 121
		mu 0 4 89 88 80 90
		f 5 122 123 -88 124 125
		mu 0 5 85 83 84 82 86
		f 3 126 -89 -124
		mu 0 3 83 77 84
		f 3 127 -126 128
		mu 0 3 81 85 86
		f 4 -125 -87 -120 129
		mu 0 4 86 82 88 89
		f 4 130 -129 -130 131
		mu 0 4 87 81 86 89
		f 4 132 -132 -122 133
		mu 0 4 79 87 89 90
		f 7 134 -134 -121 -85 135 136 137
		mu 0 7 48 79 90 80 91 96 92
		f 4 -84 -119 138 -136
		mu 0 4 91 93 95 96
		f 4 139 140 -137 -139
		mu 0 4 95 94 92 96
		f 4 141 142 -140 -118
		mu 0 4 97 53 94 95
		f 4 143 144 -90 -113
		mu 0 4 54 98 57 72
		f 4 145 146 147 148
		mu 0 4 105 99 109 108
		f 7 149 150 151 152 153 -79 -145
		mu 0 7 98 101 104 106 102 100 57
		f 3 154 155 -151
		mu 0 3 101 103 104
		f 3 156 -149 157
		mu 0 3 107 105 108
		f 5 158 -158 159 -152 -156
		mu 0 5 103 107 108 106 104
		f 4 160 -153 -160 -148
		mu 0 4 109 102 106 108
		f 7 161 162 -80 -154 163 164 165
		mu 0 7 110 144 55 100 102 112 114
		f 7 166 167 168 169 -164 -161 -147
		mu 0 7 99 49 111 116 112 102 109
		f 4 170 -70 171 -169
		mu 0 4 111 113 115 116
		f 4 172 -165 -170 -172
		mu 0 4 115 114 112 116
		f 5 173 174 -166 -173 -69
		mu 0 5 117 52 110 114 115
		f 3 175 176 177
		mu 0 3 134 138 136
		f 4 178 -142 -117 179
		mu 0 4 119 53 97 78
		f 7 -81 180 181 182 183 184 185
		mu 0 7 122 55 142 121 137 133 123
		f 7 186 -180 -82 -186 187 188 189
		mu 0 7 120 119 78 122 123 129 126
		f 4 190 191 192 193
		mu 0 4 124 131 130 128
		f 3 194 -190 195
		mu 0 3 125 120 126
		f 4 -188 196 -193 197
		mu 0 4 129 123 128 130
		f 5 198 -196 -189 -198 199
		mu 0 5 127 125 126 129 130
		f 3 200 -200 -192
		mu 0 3 131 127 130
		f 7 201 202 -194 -197 -185 203 204
		mu 0 7 132 51 124 128 123 133 135
		f 5 205 -178 206 -183 -66
		mu 0 5 118 134 136 137 121
		f 4 207 -204 -184 -207
		mu 0 4 136 135 133 137
		f 4 208 -205 -208 -177
		mu 0 4 138 132 135 136
		f 3 209 210 -175
		mu 0 3 52 140 110
		f 3 211 212 213
		mu 0 3 141 145 143
		f 5 214 -214 215 -162 -211
		mu 0 5 140 141 143 144 110
		f 4 216 -181 -163 -216
		mu 0 4 143 142 55 144
		f 5 217 -67 -182 -217 -213
		mu 0 5 145 139 121 142 143;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "shiny" -p "guts_GP";
	rename -uid "AB59F2A9-46EE-5286-E920-CEA667DD56BA";
createNode mesh -n "shinyShape" -p "shiny";
	rename -uid "D7902FCE-41F8-1394-D3C6-65BC28C80433";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 319 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.61772197 0.40445656 0.49409479
		 0.51743859 0.59153533 0.35356599 0.35287511 0.37774855 0.28305936 0.4031035 0.2830272
		 0.31776381 0.2304543 0.28683472 0.62797987 0.30614474 0.29705852 0.52230662 0.43323597
		 0.60038459 0.45142591 0.54263538 0.010509716 0.35663158 0.093061388 0.3092353 0.11671147
		 0.40810505 0.15911177 0.37798017 0.68546897 0.53539068 0.62911576 0.41988295 0.21236485
		 0.65758705 0.11550646 0.56383133 0.21737038 0.55913693 0.40176117 0.6211468 0.17177802
		 0.41377002 0.89095885 0.40846345 0.93645501 0.37567723 0.78520715 0.35360792 0.80985785
		 0.31063861 0.76884747 0.58650619 0.69749105 0.64185745 0.68622077 0.63044286 0.69678622
		 0.41308853 0.70576334 0.49103454 0.51961327 0.68221456 0.49294913 0.63714886 0.8640871
		 0.41434932 0.73269141 0.38791671 0.014838262 0.45811674 0.96475387 0.39826012 0.085917957
		 0.56149 0.090229601 0.52880079 0.19867413 0.73031139 0.20509423 0.750072 0.79075897
		 0.6439178 0.76825219 0.68297112 0.71438646 0.68181789 0.96561122 0.56589687 0.95421058
		 0.56984609 0.96201766 0.5838632 0.97292989 0.60273153 0.88740319 0.62389582 0.97143543
		 0.5483762 0.59565216 0.36596209 0.55333412 0.38065577 0.56230009 0.37697875 0.50770259
		 0.35028774 0.43941686 0.31086293 0.4006018 0.41449046 0.34439686 0.37520427 0.30697995
		 0.40238926 0.27544254 0.30629459 0.27708369 0.29928011 0.22954567 0.29928011 0.24636057
		 0.28434664 0.3041265 0.24237724 0.61561686 0.31185552 0.45083112 0.50317937 0.38350359
		 0.42750752 0.49056956 0.53172904 0.48812592 0.54487991 0.4992348 0.60260338 0.43581125
		 0.54820818 0.43855274 0.512734 0.31260014 0.55324018 0.22522469 0.40123037 0.22425584
		 0.40075776 0.2187098 0.38788241 0.26898959 0.40986028 0.29042476 0.40672696 0.19706504
		 0.3490617 0.21283805 0.23996717 0.2114152 0.23389271 0.11730388 0.35143808 0.21072216
		 0.37366679 0.20452234 0.37416017 0.11267655 0.36703748 0.12568326 0.36095336 0.63500601
		 0.41102529 0.67317307 0.41102532 0.60865074 0.41701072 0.30905718 0.65074039 0.34997854
		 0.68617934 0.21324873 0.63661993 0.25263995 0.61643583 0.25389358 0.61902028 0.30458614
		 0.56040007 0.30881011 0.63873601 0.39824861 0.60119605 0.38644075 0.61952746 0.43556696
		 0.61039257 0.44893298 0.6201036 0.21375012 0.55987614 0.20904435 0.5847618 0.20649149
		 0.58221591 0.17725192 0.39052287 0.25782713 0.20680007 0.26398382 0.20430063 0.0014102557
		 0.35759538 0.020649742 0.37504765 0.012182561 0.37625355 0.892057 0.35868347 0.90075034
		 0.35944027 0.674501 0.30563077 0.67808902 0.30276018 0.7400943 0.58650619 0.71289206
		 0.58705294 0.78322399 0.61140716 0.58744395 0.55569494 0.5990684 0.56262779 0.69311023
		 0.48455846 0.6803875 0.41622236 0.68989486 0.40915263 0.71815509 0.56989348 0.7085374
		 0.40455073 0.61056232 0.63654304 0.59899378 0.61864781 0.46985567 0.60113192 0.46859956
		 0.60970914 0.77409285 0.36554614 0.86817312 0.4004463 0.70298058 0.3538897 0.69893396
		 0.37376082 0.74513829 0.45792338 0.83921915 0.61034966 0.72245395 0.43587327 0.68281299
		 0.38753331 0.68521261 0.39752686 0.67838717 0.40934893 0.74365354 0.42720696 0.88071048
		 0.55866724 0.41109446 0.63732177 0.41748738 0.63775027 0.11092233 0.4111613 0.13146964
		 0.45345205 0.12505293 0.45465079 0.091936588 0.40443513 0.98037738 0.41097587 0.98767853
		 0.40553945 0.039255679 0.40650153 0.95355672 0.39049977 0.11441748 0.45821527 0.014949245
		 0.47452986 0.11477207 0.47454762 0.10962243 0.57734448 0.10867296 0.57268798 0.097976558
		 0.62826806 0.096365288 0.54768473 0.11323333 0.53943646 0.1065575 0.53971577 0.52194905
		 0.69038844 0.56260276 0.6822145 0.57168049 0.69038838 0.38504633 0.68200219 0.19753809
		 0.71515989 0.88352489 0.41106823 0.89647418 0.5462054 0.8896485 0.5546785 0.091259614
		 0.5153569 0.59074157 0.64552474 0.59359288 0.65674925 0.70398277 0.65489811 0.78834558
		 0.63061631 0.16186655 0.7804777 0.155524 0.78547901 0.11493748 0.75599116 0.010140559
		 0.4844619 0.038961783 0.51574129 0.030001057 0.51886123 0.96274424 0.4669373 0.96596056
		 0.55714577 0.97197962 0.54743356 0.97602439 0.55352777 0.91030186 0.58420742 0.96333104
		 0.56984609 0.87981451 0.58085543 0.88760853 0.58652359 0.85114944 0.61301261 0.97511673
		 0.54630572 0.98843193 0.52086192 0.1093531 0.74082166 0.11191981 0.67515463 0.81950778
		 0.60044563 0.80535865 0.59961158 0.77691931 0.58047712 0.10962242 0.63360524 0.10944279
		 0.64548707 0.039664663 0.59509474 0.03452133 0.60025811 0.017985273 0.58824402 0.020644955
		 0.58096337 0.015984841 0.5728544 0.034890827 0.54761064 0.023761939 0.5489189 0.023445072
		 0.54989409 0.51612902 0.35515273 0.51043415 0.36969534 0.50649142 0.35879847 0.42480221
		 0.31258875 0.41572678 0.32156941 0.41737852 0.31142181 0.41935483 0.29928011 0.42186934
		 0.30073187 0.43625507 0.30903748 0.40434414 0.43474373 0.39639443 0.44768149 0.32710484
		 0.41957229 0.45780247 0.50409651 0.4548465 0.5116449 0.45161292 0.51990223 0.44182739
		 0.52581167 0.24321151 0.43654373 0.22530293 0.40751442 0.31501621 0.4052546 0.29721439
		 0.40986028 0.22831951 0.30629334 0.22471206 0.30496672 0.19354838 0.35515273 0.19964215
		 0.35447213 0.19449648 0.35679489 0.6060158 0.40639132 0.61138111 0.42420751 0.29827049
		 0.62886792 0.29066873 0.63271707 0.29162648 0.6277405 0.29825678 0.62773037 0.40322578
		 0.60657942 0.4039256 0.60532582 0.21113651 0.38359445 0.20967741 0.38308901 0.20967741
		 0.38308901 0.21994953 0.38321999 0.21868081 0.38620788 0.25227693 0.20420492 0.25806451
		 0.2 0.30005932 0.23685174 0.30459285 0.23380484 0.59743834 0.54495555 0.59677422
		 0.55070686 0.59155768 0.54941612 0.59249049 0.54146892 0.6010167 0.5139659 0.60387653
		 0.48919898;
	setAttr ".uvst[0].uvsp[250:318]" 0.61238956 0.63184667 0.60081363 0.63551164
		 0.52066195 0.61590564 0.50278997 0.62005514 0.50356245 0.59924746 0.70784956 0.35198689
		 0.7096774 0.35515273 0.68975282 0.37914464 0.69354832 0.38308901 0.68489176 0.38094705
		 0.67590863 0.37872431 0.67582065 0.37442124 0.69315374 0.37244242 0.68749356 0.37679669
		 0.67202008 0.40587482 0.45192489 0.61440134 0.45407191 0.62026405 0.099857204 0.40568537
		 0.090469241 0.41676074 0.037711475 0.41838303 0.031234467 0.40925238 0.017411934
		 0.38531107 0.028051268 0.38811669 0.022020705 0.39329368 0.1314712 0.46845353 0.20950525
		 0.5867703 0.20782498 0.58554947 0.20586987 0.58412904 0.20593081 0.58394146 0.38765451
		 0.68749011 0.38175046 0.69038838 0.3548387 0.69038838 0.35317051 0.67715329 0.36671323
		 0.681997 0.3620784 0.69038838 0.87502378 0.40400001 0.097562224 0.52413547 0.10334414
		 0.52087063 0.59972101 0.64593196 0.57785672 0.6753363 0.58367753 0.68250996 0.57929331
		 0.68898356 0.96774191 0.46689793 0.96660686 0.48305988 0.97534204 0.44350699 0.93180835
		 0.52172178 0.89090431 0.58412904 0.90022492 0.55807698 0.90622127 0.54131645 0.91128808
		 0.54331142 0.91462034 0.56237566 0.13473085 0.73556721 0.12566505 0.75417548 0.10934341
		 0.74502814 0.11246995 0.66023457 0.11290322 0.64848393 0.11290322 0.64848393 0.11290322
		 0.64521194 0.11290321 0.63863474 0.11254881 0.65381169 0.097563066 0.63519895 0.1003418
		 0.62556791 0.014653003 0.57695335 0.022289775 0.55344975 0.026703738 0.56232798 0.04081405
		 0.52938116 0.032258064 0.52277052 0.76317358 0.56989348 0.78045851 0.57417274;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 172 ".pt";
	setAttr ".pt[0:165]" -type "float3"  -0.0051544756 0.19357777 -0.21543801 
		-0.03413716 0.17998719 -0.23373991 -0.04374823 0.19876897 -0.20810604 -0.016549267 
		0.20843405 -0.19274175 0.17413431 0.23591018 -0.10627773 0.1849159 0.24597025 -0.073293775 
		0.20959347 0.22611201 -0.072097957 0.22617406 0.20982623 -0.09504208 0.21891707 0.20928729 
		-0.12544051 0.18875378 0.19673264 -0.15006834 0.16415936 0.21181279 -0.13686866 0.043985724 
		0.31992221 0.03615728 0.006780073 0.31559289 0.033949986 0.0088635534 0.31486523 
		0.050182804 0.12217435 0.28771162 0.078542948 -0.18994105 0.20018339 0.055563286 
		-0.21298182 0.18399298 0.074659973 -0.22535408 0.1749348 0.1076473 -0.18525183 0.2015183 
		0.091869801 -0.15073293 0.22328639 0.076185971 -0.16923541 0.22536057 0.059873909 
		0.25269163 0.18268412 0.11230585 0.25634551 0.18824643 0.11085874 0.20260459 0.24199611 
		0.1057885 0.17371136 0.28794682 0.07654196 0.17879152 0.27375627 0.096168339 0.19910628 
		0.27115667 0.08553043 0.3108803 0.1326797 -0.12522268 0.31659639 0.14345831 -0.10404763 
		0.33017015 0.11729002 -0.11074907 0.3656882 0.034121886 0.015824568 0.35457647 0.066764981 
		0.0022801813 0.34120774 0.087473243 0.022236131 0.34775412 0.062471598 0.041423932 
		-0.10127142 0.1345281 -0.27669907 -0.12129885 0.10704011 -0.27868807 -0.11282963 
		0.13534659 -0.2637018 -0.1332882 -0.042602643 0.31637871 -0.13289392 -0.072691858 
		0.30810261 -0.091856211 -0.067119807 0.31788707 -0.064125061 -0.051016122 0.31586015 
		-0.09760195 -0.033178687 0.31721723 -0.27560282 0.049060285 0.22738743 -0.24439913 
		0.041704118 0.2422933 -0.24162298 0.077282727 0.22211677 -0.27097785 0.078505188 
		0.20990914 0.25759172 0.08667919 0.10009146 0.28038144 0.056800812 0.10626543 0.30201399 
		0.093548924 0.074945778 0.29266059 0.11750117 0.054070294 0.27612972 0.13825482 0.071902514 
		0.26378441 0.13498282 0.086262763 0.24483281 0.11392033 0.088166624 0.3044256 -0.072888076 
		-0.19988847 0.31285095 -0.039735466 -0.18725908 0.33241582 -0.06475535 -0.16673076 
		0.32213879 -0.093822002 -0.17952436 0.21673387 0.10002223 -0.2683233 0.20609939 0.077904999 
		-0.2849468 0.19545221 0.099922121 -0.27674532 -0.23112077 -0.16424018 -0.15101498 
		-0.21228904 -0.20538443 -0.12031829 -0.25567162 -0.16703367 -0.1220037 -0.2636987 
		-0.13934141 -0.11928174 -0.24496472 -0.12634668 -0.14249384 -0.21204579 -0.095362723 
		-0.18842816 -0.15078366 -0.073742807 -0.22961766 -0.3264823 -0.13636994 -0.019800313 
		-0.33887458 -0.1164687 0.0055417642 -0.32715082 -0.11157799 -0.026267558 -0.34284317 
		0.010749321 0.11495879 -0.34172654 0.033603206 0.14804041 -0.3308574 0.06346187 0.14421809 
		-0.33224344 0.05455938 0.11541671 0.12779385 -0.010780592 -0.30926573 0.096541792 
		-0.023084536 -0.30809677 0.10039249 0.0072513688 -0.31518066 0.0035966365 -0.045756012 
		-0.26115417 -0.040137306 -0.080108047 -0.237225 -0.043670535 -0.037774593 -0.27410662 
		-0.029821262 0.0078659989 -0.30904937 -0.0065385718 0.034617573 -0.312814 0.022020593 
		0.054668367 -0.29561555 0.039437622 0.024935454 -0.31027532 0.031369895 0.00096920878 
		-0.30931354 -0.06874156 0.035718724 -0.31461298 -0.072334796 0.0076194853 -0.30797148 
		-0.095792949 0.025207527 -0.30454028 -0.31862795 0.025640607 0.21722329 -0.32249141 
		0.04676041 0.19651538 -0.3360945 0.020958103 0.19577497 0.39135063 -0.054813504 0.025607906 
		0.39038467 -0.045632228 0.052010059 0.39115381 -0.074560046 0.043718025 0.36680901 
		-0.14952582 -0.010079399 0.36328852 -0.15514594 -0.042415455 0.37671447 -0.12653333 
		-0.032435298 0.34826267 -0.1077559 -0.13013077 0.35957861 -0.084920168 -0.12421048 
		0.36973035 -0.097552866 -0.095560759 0.35638177 -0.12288728 -0.099525928 0.31292892 
		-0.11929518 0.16625965 0.3324517 -0.097728074 0.14979005 0.33008659 -0.068766952 
		0.15665942 0.30883586 -0.088559628 0.1714412 0.18327564 -0.18920255 0.21949714 0.15386921 
		-0.17963469 0.23422152 0.13490576 -0.19817525 0.23087549 0.11076266 -0.23758775 0.19679415 
		0.14854658 -0.23493856 0.20809877 0.17975789 -0.21796489 0.21235436 -0.32965815 -0.072151005 
		0.2189821 -0.31363666 -0.093547523 0.2321251 -0.31289327 -0.064911455 0.24097174 
		-0.23722434 -0.10700902 0.26764977 -0.2411325 -0.078075558 0.27456343 -0.27188706 
		-0.077251613 0.26066267 -0.26733017 -0.10726762 0.25492847 0.25017715 -0.15121919 
		-0.22760004 0.22857291 -0.1505813 -0.24247235 0.24755728 -0.13102907 -0.2450065 0.23400354 
		-0.22718692 0.18032855 0.26033592 -0.21337664 0.16886604 0.24399006 -0.19895709 0.19260013 
		-0.32093525 -0.16498297 0.065363437 -0.34312904 -0.13796645 0.05674547 -0.32209384 
		-0.15542084 0.033429474 -0.33494794 -0.14930952 0.11623737 -0.32009828 -0.1759392 
		0.1175245 -0.31893504 -0.16857708 0.14706618 -0.33416402 -0.13382316 0.14938706 0.30387306 
		-0.25115204 0.0095198639 0.28367639 -0.27071214 -0.0023934664 0.29951143 -0.24517864 
		-0.020434491 0.32168531 -0.22818232 -0.0070937853 0.1802603 -0.32454038 0.085477561 
		0.11636648 -0.34651446 0.073399454 0.043146685 -0.34992766 0.018817954 0.033318967 
		-0.3385278 -0.0088723041 0.063736171 -0.32046926 -0.033514887 0.10124689 -0.31187963 
		-0.034750372 0.1290105 -0.3126595 -0.014877521 0.10800219 -0.33670926 0.014160626 
		-0.21400577 -0.20476216 0.17952091 -0.24038321 -0.22130513 0.15237749 -0.22705889 
		-0.24196297 0.12350249 -0.20282614 -0.24028629 0.13796854 -0.15367037 -0.28244555 
		-0.0093441047 -0.15393549 -0.27129495 -0.055905282 -0.12348288 -0.27931643 -0.042976886 
		-0.10350344 -0.30174124 -0.011542954 -0.08203572 -0.31719446 0.016566858 -0.054110259 
		-0.29921532 0.060511947 -0.12089217 -0.29836345 0.022869021 -0.15884769 -0.28445399 
		0.024853602 0.048864767 -0.32925713 0.13558775 0.071390063 -0.31927359 0.15440875 
		0.045147091 -0.3091805 0.15107167 0.096118957 -0.34559357 0.10165438 0.12581906 -0.34547555 
		0.088025093 0.12285626 -0.33551991 0.11693406 0.13360661 -0.34348571 0.086683393 
		0.17614514 -0.32526326 0.082306713 0.18798345 -0.31424868 0.11150935 0.15647417 -0.32733238 
		0.11153901 0.24123704 -0.295434 0.083975375;
	setAttr ".pt[166:171]" 0.25655735 -0.27747953 0.10293227 0.23250949 -0.29067624 
		0.11693525 0.17361528 -0.326599 0.081995547 -0.17002207 -0.24575204 -0.11256066 -0.1649437 
		-0.22744346 -0.13886887 -0.14532977 -0.24462706 -0.1199196;
	setAttr -s 172 ".vt";
	setAttr ".vt[0:165]"  -0.015502211 0.58219004 -0.64793509 -0.10266836 0.54131621 -0.70297873
		 -0.13157393 0.59780276 -0.62588435 -0.049772356 0.62687069 -0.57967561 0.52371329 0.70950592 -0.31963304
		 0.55613923 0.73976171 -0.22043291 0.63035768 0.68003768 -0.21683641 0.6802243 0.6310578 -0.28584146
		 0.65839863 0.62943685 -0.37726557 0.56768185 0.5916785 -0.45133439 0.49371368 0.63703239 -0.41163597
		 0.13228816 0.96217442 0.10874391 0.020391244 0.94915378 0.10210543 0.026657362 0.9469654 0.1509261
		 0.36744243 0.8653 0.23621994 -0.57125258 0.60205668 0.16710798 -0.64054823 0.5533635 0.2245418
		 -0.67775816 0.5261209 0.32375199 -0.55714959 0.60607147 0.27630076 -0.45333311 0.6715396 0.22913122
		 -0.50897974 0.67777777 0.18007226 0.75997657 0.54942721 0.33776271 0.77096593 0.56615591 0.3334105
		 0.60933864 0.72780949 0.31816167 0.52244133 0.86600739 0.23020186 0.53772002 0.82332909 0.28922877
		 0.59881729 0.81551063 0.25723502 0.93498051 0.39903769 -0.3766104 0.9521718 0.43145451 -0.31292588
		 0.99299514 0.35275266 -0.33308065 1.099816799 0.10262246 0.047592789 1.066397548 0.20079735 0.006857703
		 1.026191235 0.26307803 0.066875733 1.045879722 0.18788494 0.12458351 -0.30457634 0.40459663 -0.83217949
		 -0.36480936 0.32192582 -0.83816165 -0.33933797 0.4070583 -0.79308987 -0.40086779 -0.12812853 0.95151705
		 -0.39968175 -0.21862264 0.9266265 -0.27625999 -0.20186453 0.95605361 -0.19285776 -0.15343226 0.94995767
		 -0.29354039 -0.099785715 0.95403904 -0.8288821 0.14755003 0.68387365 -0.73503661 0.12542619 0.72870326
		 -0.72668719 0.23242974 0.66802186 -0.81497258 0.23610638 0.6313073 0.7747137 0.2606898 0.30102766
		 0.84325427 0.17082989 0.31959599 0.90831459 0.28135076 0.22540134 0.88018435 0.35338777 0.16261782
		 0.83046716 0.41580483 0.21624859 0.79333854 0.40596443 0.2594375 0.73634082 0.34261838 0.26516336
		 0.91556776 -0.21921274 -0.60116982 0.94090736 -0.11950542 -0.56318647 0.9997493 -0.19475338 -0.5014469
		 0.9688403 -0.28217205 -0.53992403 0.6518327 0.30081934 -0.80698919 0.61984915 0.23430121 -0.85698467
		 0.5878275 0.30051836 -0.83231854 -0.69510144 -0.49395654 -0.45418128 -0.63846469 -0.61769891 -0.36186036
		 -0.7689389 -0.50235802 -0.3669292 -0.79308075 -0.41907275 -0.35874286 -0.73673761 -0.37999076 -0.42855391
		 -0.63773316 -0.28680575 -0.5667026 -0.45348579 -0.22178334 -0.69058108 -0.98190373 -0.41013604 -0.059549958
		 -1.019174337 -0.35028261 0.016667001 -0.98391438 -0.33557367 -0.079000361 -1.03110981 0.032328859 0.34574148
		 -1.027751446 0.10106251 0.4452354 -0.99506181 0.19086315 0.43373957 -0.99923038 0.16408873 0.34711877
		 0.3843433 -0.032422911 -0.93012434 0.2903519 -0.069427334 -0.92660898 0.30193305 0.021808675 -0.94791383
		 0.010816976 -0.13761239 -0.78542781 -0.12071397 -0.24092697 -0.71346027 -0.13134024 -0.11360804 -0.82438278
		 -0.089688234 0.023657192 -0.92947364 -0.019664925 0.10411321 -0.94079614 0.066227496 0.16441651 -0.88907135
		 0.11860968 0.074994035 -0.93316078 0.094345771 0.0029149202 -0.93026835 -0.20674202 0.107425 -0.94620645
		 -0.21754877 0.022915795 -0.92623228 -0.28809971 0.075812258 -0.91591263 -0.95828199 0.077114768 0.65330464
		 -0.96990108 0.14063312 0.59102494 -1.010812879 0.063032016 0.58879822 1.17699683 -0.16485301 0.077016413
		 1.1740917 -0.1372401 0.15642157 1.17640507 -0.22424121 0.13148309 1.10318732 -0.44970286 -0.030314049
		 1.092599273 -0.46660551 -0.12756555 1.13297844 -0.38055217 -0.097549953 1.047408938 -0.32407865 -0.39137152
		 1.081441998 -0.25539958 -0.37356618 1.11197329 -0.29339269 -0.28740144 1.071827292 -0.36958668 -0.29932669
		 0.94114166 -0.35878327 0.5000301 0.99985713 -0.29391968 0.45049742 0.99274421 -0.20681833 0.47115722
		 0.92883176 -0.26634526 0.51561379 0.55120611 -0.56903148 0.6601432 0.46276557 -0.54025596 0.70442712
		 0.40573251 -0.59601718 0.69436383 0.33312154 -0.71455127 0.59186351 0.44675773 -0.70658374 0.62586224
		 0.54062653 -0.65553492 0.63866132 -0.99145526 -0.21699606 0.65859425 -0.94327056 -0.28134656 0.69812226
		 -0.9410345 -0.19522284 0.72472864 -0.71345848 -0.32183233 0.80496335 -0.72521216 -0.23481421 0.82575643
		 -0.81770754 -0.23233624 0.78394985 -0.8040024 -0.32261008 0.7667039 0.75241405 -0.45479572 -0.68451291
		 0.68743885 -0.4528771 -0.72924185 0.74453485 -0.39407313 -0.73686355 0.70377165 -0.68327028 0.54234266
		 0.78296697 -0.64173567 0.50786889 0.73380637 -0.59836841 0.57924986 -0.96522111 -0.49619064 0.1965822
		 -1.03196919 -0.41493765 0.17066345 -0.96870559 -0.46743202 0.10053997 -1.0073645115 -0.44905216 0.34958676
		 -0.96270365 -0.52914155 0.35345787 -0.95920539 -0.50699991 0.44230515 -1.0050069094 -0.40247646 0.44928524
		 0.91390622 -0.75534618 0.028631242 0.85316402 -0.81417352 -0.0071984115 0.90078825 -0.73738104 -0.061457276
		 0.9674769 -0.6862641 -0.021334738 0.54213756 -0.97606337 0.25707594 0.34997508 -1.042151093 0.22075069
		 0.12976474 -1.052416325 0.056595474 0.10020763 -1.018131375 -0.026683683 0.19168812 -0.96381956 -0.10079686
		 0.30450258 -0.9379859 -0.10451265 0.38800237 -0.94033134 -0.044744529 0.32481933 -1.012661576 0.042588439
		 -0.64362794 -0.61582744 0.53991371 -0.72295868 -0.66558081 0.45827922 -0.68288541 -0.72770971 0.37143689
		 -0.6100049 -0.72266722 0.4149439 -0.46216744 -0.84946209 -0.028102634 -0.46296498 -0.81592649 -0.16813657
		 -0.37137789 -0.84005123 -0.12925409 -0.31128922 -0.90749443 -0.034715727 -0.24672449 -0.95397049 0.049825247
		 -0.16273798 -0.89989793 0.18199122 -0.36358625 -0.89733559 0.068779163 -0.47773844 -0.85550272 0.074747846
		 0.14696205 -0.99024916 0.40778369 0.21470745 -0.96022362 0.46438837 0.13578101 -0.92986834 0.4543519
		 0.28908029 -1.039381385 0.30572814 0.37840405 -1.03902626 0.26473776 0.36949328 -1.0090845823 0.35168228
		 0.40182549 -1.033042073 0.26070258 0.52976102 -0.97823769 0.24753951 0.56536484 -0.94511098 0.33536723
		 0.47059995 -0.98446029 0.33545646 0.72552663 -0.88852507 0.25255814;
	setAttr ".vt[166:171]" 0.77160245 -0.8345269 0.30957139 0.6992783 -0.87421608 0.35168576
		 0.52215242 -0.98225462 0.24660376 -0.51134574 -0.73910552 -0.33852908 -0.49607226 -0.68404198 -0.41765171
		 -0.43708295 -0.73572201 -0.3606613;
	setAttr -s 344 ".ed";
	setAttr ".ed[0:165]"  81 85 0 85 34 0 34 1 0 1 81 1 36 64 1 64 15 1 15 2 1
		 2 36 0 20 12 0 12 4 1 4 3 1 3 20 1 10 82 1 82 0 1 0 10 1 11 24 0 24 5 1 5 11 1 26 22 0
		 22 50 0 50 6 1 6 26 1 49 32 1 32 28 1 28 7 0 7 49 1 27 54 1 54 57 1 57 8 0 8 27 1
		 59 76 0 76 83 0 83 9 1 9 59 1 19 51 1 51 21 0 21 13 1 13 19 0 23 25 0 25 14 0 14 23 1
		 63 69 0 69 73 1 73 16 1 16 63 1 72 89 1 89 45 1 45 17 1 17 72 0 44 41 1 41 52 1 52 18 1
		 18 44 1 31 98 1 98 55 1 55 29 1 29 31 1 48 103 0 103 92 1 92 33 1 33 48 1 91 96 1
		 96 99 1 99 30 1 30 91 1 87 65 1 65 35 1 35 87 1 114 143 1 143 38 1 38 114 1 146 153 1
		 153 107 0 107 39 0 39 146 1 106 46 1 46 40 1 40 106 0 43 115 1 115 37 1 37 43 1 88 113 0
		 113 116 1 116 42 1 42 88 1 105 123 0 123 104 0 104 47 1 47 105 1 97 140 1 140 118 1
		 118 56 0 56 97 0 120 74 1 74 58 1 58 53 1 53 120 1 169 148 0 148 61 1 61 169 1 147 126 1
		 126 67 1 67 62 0 62 147 1 86 80 0 80 66 1 66 86 1 79 170 1 170 60 1 60 79 1 125 127 0
		 127 70 1 70 68 1 68 125 0 130 111 1 111 90 0 90 71 1 71 130 1 119 139 0 139 84 1
		 84 75 0 75 119 0 149 171 0 171 78 1 78 149 1 138 150 1 150 77 1 77 138 1 102 134 1
		 134 94 0 94 93 1 93 102 1 133 141 1 141 100 1 100 95 0 95 133 0 122 166 1 166 131 1
		 131 101 1 101 122 0 152 157 0 157 108 0 108 152 0 156 160 1 160 164 1 164 109 1 109 156 0
		 163 167 0 167 121 1 121 110 1 110 163 1 129 144 1 144 117 1 117 112 1 112 129 1 154 145 0
		 145 128 1 128 124 1 124 154 1 165 142 1 142 132 0 132 165 1 161 159 1 159 136 1 136 161 1
		 158 155 1;
	setAttr ".ed[166:331]" 155 151 0 151 137 1 137 158 1 168 162 0 162 135 1 135 168 1
		 1 0 1 82 81 0 2 1 1 34 36 1 3 2 0 15 20 1 0 3 1 4 10 1 5 4 1 12 11 0 6 5 1 24 26 0
		 7 6 0 50 49 0 8 7 1 28 27 1 9 8 1 57 59 1 10 9 1 83 82 0 13 12 1 20 19 1 14 13 0
		 21 23 1 11 14 1 25 24 1 16 15 0 64 63 1 17 16 1 73 72 1 18 17 0 45 44 1 19 18 0 52 51 1
		 22 21 0 51 50 0 23 22 0 26 25 1 29 28 1 32 31 1 27 29 1 55 54 1 31 30 1 99 98 0 33 32 1
		 49 48 1 30 33 1 92 91 1 35 34 0 85 87 1 36 35 1 65 64 1 38 37 1 115 114 1 39 38 0
		 143 146 1 40 39 1 107 106 1 41 40 0 46 52 1 37 41 0 44 43 1 43 42 1 116 115 1 42 45 1
		 89 88 1 47 46 1 106 105 0 48 47 1 104 103 0 54 53 1 58 57 0 56 55 1 98 97 1 53 56 1
		 118 120 1 59 58 1 74 76 1 61 60 0 170 169 1 62 61 0 148 147 1 63 62 1 67 69 1 66 65 0
		 87 86 1 60 66 0 80 79 1 68 67 1 126 125 1 69 68 1 70 73 1 71 70 1 127 130 1 72 71 1
		 90 89 1 75 74 1 120 119 1 76 75 1 84 83 1 78 77 1 150 149 0 79 78 1 171 170 1 81 80 1
		 86 85 1 77 84 1 139 138 0 88 90 1 111 113 1 93 92 1 103 102 1 91 93 1 94 96 1 95 94 1
		 134 133 1 96 95 1 100 99 1 97 100 0 141 140 1 102 101 0 131 134 0 101 104 1 123 122 1
		 108 107 0 153 152 0 109 108 1 157 156 1 110 109 1 164 163 0 105 110 1 121 123 1 112 111 1
		 130 129 1 113 112 1 117 116 1 114 117 1 144 143 1 119 118 1 140 139 1 122 121 1 167 166 1
		 125 124 1 128 127 1 124 126 1 147 154 1 129 128 1 145 144 1 132 131 1 166 165 1 133 132 0
		 142 141 1 136 135 1 162 161 1 137 136 1 159 158 1 138 137 1 151 150 1 135 142 1 165 168 1;
	setAttr ".ed[332:343]" 146 145 1 154 153 1 149 148 0 169 171 1 152 151 0 155 157 1
		 156 155 0 158 160 1 160 159 1 161 164 1 163 162 1 168 167 1;
	setAttr -s 174 -ch 688 ".fc[0:173]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 133 264 0 50
		f 4 4 5 6 7
		mu 0 4 87 247 1 51
		f 4 8 9 10 11
		mu 0 4 64 211 205 204
		f 3 12 13 14
		mu 0 3 63 261 2
		f 3 15 16 17
		mu 0 3 65 220 3
		f 4 18 19 20 21
		mu 0 4 4 72 238 5
		f 4 22 23 24 25
		mu 0 4 81 225 222 58
		f 4 26 27 28 29
		mu 0 4 78 103 242 6
		f 4 30 31 32 33
		mu 0 4 110 128 262 7
		f 4 34 35 36 37
		mu 0 4 70 8 218 212
		f 3 38 39 40
		mu 0 3 75 221 213
		f 4 41 42 43 44
		mu 0 4 115 123 254 66
		f 4 45 46 47 48
		mu 0 4 124 265 9 10
		f 4 49 50 51 52
		mu 0 4 95 232 71 217
		f 4 53 54 55 56
		mu 0 4 80 106 11 12
		f 4 57 58 59 60
		mu 0 4 102 141 13 14
		f 4 61 62 63 64
		mu 0 4 143 146 272 83
		f 3 65 66 67
		mu 0 3 118 15 16
		f 3 68 69 70
		mu 0 3 161 301 17
		f 4 71 72 73 74
		mu 0 4 187 309 18 90
		f 3 75 76 77
		mu 0 3 100 19 91
		f 3 78 79 80
		mu 0 3 96 282 94
		f 4 81 82 83 84
		mu 0 4 138 160 283 20
		f 4 85 86 87 88
		mu 0 4 155 287 274 21
		f 4 89 90 91 92
		mu 0 4 147 163 22 23
		f 4 93 94 95 96
		mu 0 4 127 24 25 108
		f 3 97 98 99
		mu 0 3 26 114 112
		f 4 100 101 102 103
		mu 0 4 169 27 28 113
		f 3 104 105 106
		mu 0 3 29 121 30
		f 3 107 108 109
		mu 0 3 132 317 120
		f 4 110 111 112 113
		mu 0 4 166 289 252 251
		f 4 114 115 116 117
		mu 0 4 158 31 32 253
		f 4 118 119 120 121
		mu 0 4 33 137 34 126
		f 3 122 123 124
		mu 0 3 189 318 130
		f 3 125 126 127
		mu 0 3 182 131 136
		f 4 128 129 130 131
		mu 0 4 148 35 269 268
		f 4 132 133 134 135
		mu 0 4 176 299 36 144
		f 4 136 137 138 139
		mu 0 4 165 174 149 150
		f 3 140 141 142
		mu 0 3 192 311 151
		f 4 143 144 145 146
		mu 0 4 194 197 314 37
		f 4 147 148 149 150
		mu 0 4 199 315 38 154
		f 4 151 152 153 154
		mu 0 4 170 302 39 40
		f 4 155 156 157 158
		mu 0 4 41 42 43 168
		f 3 159 160 161
		mu 0 3 186 300 293
		f 3 162 163 164
		mu 0 3 44 181 45
		f 4 165 166 167 168
		mu 0 4 46 47 48 180
		f 3 169 170 171
		mu 0 3 49 178 185
		f 4 172 -14 173 -4
		mu 0 4 50 2 261 133
		f 4 174 -3 175 -8
		mu 0 4 51 52 227 87
		f 4 176 -7 177 -12
		mu 0 4 204 203 214 64
		f 4 178 -11 179 -15
		mu 0 4 53 204 205 54
		f 4 180 -10 181 -18
		mu 0 4 206 205 211 55
		f 4 182 -17 183 -22
		mu 0 4 56 3 220 57
		f 4 184 -21 185 -26
		mu 0 4 58 5 238 81
		f 4 186 -25 187 -30
		mu 0 4 59 58 222 60
		f 4 188 -29 189 -34
		mu 0 4 61 6 242 62
		f 4 190 -33 191 -13
		mu 0 4 63 7 262 261
		f 4 192 -9 193 -38
		mu 0 4 212 211 64 70
		f 4 194 -37 195 -41
		mu 0 4 213 212 218 75
		f 4 196 -40 197 -16
		mu 0 4 65 213 221 220
		f 4 198 -6 199 -45
		mu 0 4 66 1 247 115
		f 4 200 -44 201 -49
		mu 0 4 67 66 254 68
		f 4 202 -48 203 -53
		mu 0 4 217 69 234 95
		f 4 204 -52 205 -35
		mu 0 4 70 217 71 8
		f 4 206 -36 207 -20
		mu 0 4 72 73 74 238
		f 4 208 -19 209 -39
		mu 0 4 75 219 76 221
		f 4 210 -24 211 -57
		mu 0 4 223 222 225 77
		f 4 212 -56 213 -27
		mu 0 4 78 79 240 103
		f 4 214 -64 215 -54
		mu 0 4 80 83 272 106
		f 4 216 -23 217 -61
		mu 0 4 226 225 81 82
		f 4 218 -60 219 -65
		mu 0 4 83 84 267 143
		f 4 220 -2 221 -68
		mu 0 4 85 0 264 86
		f 4 222 -67 223 -5
		mu 0 4 87 228 248 247
		f 4 224 -80 225 -71
		mu 0 4 88 94 282 89
		f 4 226 -70 227 -75
		mu 0 4 90 17 301 187
		f 4 228 -74 229 -78
		mu 0 4 91 92 275 100
		f 4 230 -77 231 -51
		mu 0 4 232 231 93 71
		f 4 232 -50 233 -81
		mu 0 4 94 232 95 96
		f 4 234 -84 235 -79
		mu 0 4 96 20 283 282
		f 4 236 -47 237 -85
		mu 0 4 97 9 265 98
		f 4 238 -76 239 -89
		mu 0 4 99 19 100 101
		f 4 240 -88 241 -58
		mu 0 4 102 21 274 141
		f 4 242 -96 243 -28
		mu 0 4 103 104 243 242
		f 4 244 -55 245 -93
		mu 0 4 105 11 106 107
		f 4 246 -92 247 -97
		mu 0 4 108 109 285 127
		f 4 248 -95 249 -31
		mu 0 4 110 111 255 128
		f 4 250 -109 251 -100
		mu 0 4 112 120 317 26
		f 4 252 -99 253 -104
		mu 0 4 113 112 114 169
		f 4 254 -103 255 -42
		mu 0 4 115 116 250 123
		f 4 256 -66 257 -107
		mu 0 4 117 15 118 119
		f 4 258 -106 259 -110
		mu 0 4 120 30 121 132
		f 4 260 -102 261 -114
		mu 0 4 251 122 288 166
		f 4 262 -113 263 -43
		mu 0 4 123 251 252 254
		f 4 264 -112 265 -118
		mu 0 4 253 252 289 158
		f 4 266 -117 267 -46
		mu 0 4 124 125 266 265
		f 4 268 -94 269 -122
		mu 0 4 126 24 127 33
		f 4 270 -121 271 -32
		mu 0 4 128 256 129 262
		f 4 272 -127 273 -125
		mu 0 4 130 136 131 189
		f 4 274 -124 275 -108
		mu 0 4 132 130 318 317
		f 4 276 -105 277 -1
		mu 0 4 133 134 135 264
		f 4 278 -120 279 -128
		mu 0 4 136 34 137 182
		f 4 280 -116 281 -82
		mu 0 4 138 139 279 160
		f 4 282 -59 283 -132
		mu 0 4 140 13 141 142
		f 4 284 -131 285 -62
		mu 0 4 143 268 269 146
		f 4 286 -130 287 -136
		mu 0 4 144 145 294 176
		f 4 288 -135 289 -63
		mu 0 4 146 270 273 272
		f 4 290 -134 291 -90
		mu 0 4 147 36 299 163
		f 4 292 -139 293 -129
		mu 0 4 148 150 149 35
		f 4 294 -87 295 -140
		mu 0 4 150 274 287 165
		f 4 296 -73 297 -143
		mu 0 4 151 18 309 192
		f 4 298 -142 299 -147
		mu 0 4 152 151 311 153
		f 4 300 -146 301 -151
		mu 0 4 154 37 314 199
		f 4 302 -150 303 -86
		mu 0 4 155 156 286 287
		f 4 304 -115 305 -155
		mu 0 4 157 31 158 159
		f 4 306 -154 307 -83
		mu 0 4 160 280 284 283
		f 4 308 -153 309 -69
		mu 0 4 161 39 302 301
		f 4 310 -91 311 -119
		mu 0 4 162 22 163 164
		f 4 312 -149 313 -137
		mu 0 4 165 38 315 174
		f 4 314 -158 315 -111
		mu 0 4 166 167 290 289
		f 4 316 -101 317 -159
		mu 0 4 168 27 169 41
		f 4 318 -157 319 -152
		mu 0 4 170 171 172 302
		f 4 320 -138 321 -162
		mu 0 4 173 149 174 175
		f 4 322 -161 323 -133
		mu 0 4 176 293 300 299
		f 4 324 -171 325 -165
		mu 0 4 177 185 178 179
		f 4 326 -164 327 -169
		mu 0 4 180 45 181 46
		f 4 328 -168 329 -126
		mu 0 4 182 183 184 131
		f 4 330 -160 331 -172
		mu 0 4 185 300 186 49
		f 4 332 -156 333 -72
		mu 0 4 187 303 188 309
		f 4 334 -98 335 -123
		mu 0 4 189 190 191 318
		f 4 336 -167 337 -141
		mu 0 4 192 193 310 311
		f 4 338 -166 339 -144
		mu 0 4 194 195 196 197
		f 4 340 -163 341 -145
		mu 0 4 197 312 198 314
		f 4 342 -170 343 -148
		mu 0 4 199 200 201 315
		f 4 -173 -175 -177 -179
		mu 0 4 53 202 203 204
		f 7 -181 -183 -185 -187 -189 -191 -180
		mu 0 7 205 206 207 208 209 210 54
		f 4 -182 -193 -195 -197
		mu 0 4 55 211 212 213
		f 6 -199 -201 -203 -205 -194 -178
		mu 0 6 214 215 216 217 70 64
		f 3 -207 -209 -196
		mu 0 3 218 219 75
		f 3 -198 -210 -184
		mu 0 3 220 221 76
		f 3 -188 -211 -213
		mu 0 3 60 222 223
		f 4 -215 -212 -217 -219
		mu 0 4 224 77 225 226
		f 3 -221 -223 -176
		mu 0 3 227 228 87
		f 5 -225 -227 -229 -231 -233
		mu 0 5 94 229 230 231 232
		f 4 -235 -234 -204 -237
		mu 0 4 233 96 95 234
		f 7 -239 -241 -218 -186 -208 -206 -232
		mu 0 7 235 236 237 81 238 74 239
		f 4 -243 -214 -245 -247
		mu 0 4 104 103 240 241
		f 3 -244 -249 -190
		mu 0 3 242 243 62
		f 7 -251 -253 -255 -200 -224 -257 -259
		mu 0 7 244 245 246 115 247 248 249
		f 3 -261 -263 -256
		mu 0 3 250 251 123
		f 4 -265 -267 -202 -264
		mu 0 4 252 253 68 254
		f 3 -269 -271 -250
		mu 0 3 255 256 128
		f 8 -273 -275 -260 -277 -174 -192 -272 -279
		mu 0 8 257 258 259 260 133 261 262 263
		f 3 -278 -258 -222
		mu 0 3 264 135 86
		f 3 -238 -268 -281
		mu 0 3 98 265 266
		f 3 -220 -283 -285
		mu 0 3 143 267 268
		f 3 -287 -289 -286
		mu 0 3 269 270 146
		f 4 -246 -216 -290 -291
		mu 0 4 271 106 272 273
		f 4 -293 -284 -242 -295
		mu 0 4 150 142 141 274
		f 6 -240 -230 -297 -299 -301 -303
		mu 0 6 101 100 275 276 277 278
		f 3 -305 -307 -282
		mu 0 3 279 280 160
		f 4 -226 -236 -308 -309
		mu 0 4 281 282 283 284
		f 3 -311 -270 -248
		mu 0 3 285 33 127
		f 3 -313 -296 -304
		mu 0 3 286 165 287
		f 3 -315 -262 -317
		mu 0 3 167 166 288
		f 4 -316 -319 -306 -266
		mu 0 4 289 290 291 158
		f 4 -321 -323 -288 -294
		mu 0 4 292 293 176 294
		f 8 -325 -327 -329 -280 -312 -292 -324 -331
		mu 0 8 185 295 296 297 298 163 299 300
		f 4 -310 -320 -333 -228
		mu 0 4 301 302 303 187
		f 8 -254 -335 -274 -330 -337 -298 -334 -318
		mu 0 8 304 305 306 307 308 192 309 188
		f 3 -339 -300 -338
		mu 0 3 310 153 311
		f 3 -328 -341 -340
		mu 0 3 196 312 197
		f 4 -326 -343 -302 -342
		mu 0 4 198 313 199 314
		f 4 -322 -314 -344 -332
		mu 0 4 175 174 315 316
		f 3 -252 -276 -336
		mu 0 3 26 317 318;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "star1" -p "guts_GP";
	rename -uid "899D76FC-4325-6511-3A33-6BB099CDA2BE";
createNode nurbsCurve -n "star1Shape" -p "star1";
	rename -uid "437EA192-452C-7672-1F3B-3292A112DA7A";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[1:10]" -type "double3" 0 -1.9684894738379122 -1.2792020037541763 
		0 0 0 0 0.46469732881854098 -2.0697923205512279 0 0 0 0 1.9684894738379124 -1.3326045807125238e-016 
		0 0 0 0 0.46469732881854142 2.0697923205512279 0 0 0 0 -1.9684894738379122 1.2792020037541763 
		0 0 0;
createNode transform -n "curve2" -p "guts_GP";
	rename -uid "78DBA5B3-4B0B-6359-7734-4AB83024E65B";
createNode nurbsCurve -n "curveShape2" -p "curve2";
	rename -uid "E6813AE8-4299-7F57-9172-3DAC5B64637A";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "curve3" -p "guts_GP";
	rename -uid "DAC1FB2B-4BD6-C341-3047-F29CDF840B80";
	setAttr ".r" -type "double3" -89.999999999999943 0 0 ;
createNode nurbsCurve -n "curveShape3" -p "curve3";
	rename -uid "84133A08-4320-218D-D348-038AC3D18842";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "curve4" -p "guts_GP";
	rename -uid "E8074C31-4FD4-D3B3-15D8-3FA0A061B442";
	setAttr ".r" -type "double3" -179.99999999999997 0 0 ;
createNode nurbsCurve -n "curveShape4" -p "curve4";
	rename -uid "93F8D776-4A75-5434-8720-3E8CBE6D7C35";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "curve5" -p "guts_GP";
	rename -uid "40EC10C5-4C1E-6814-5943-95A371408479";
	setAttr ".r" -type "double3" 90.000000000000071 0 0 ;
createNode nurbsCurve -n "curveShape5" -p "curve5";
	rename -uid "4720E93D-495B-7FFF-3910-1BB373D334F7";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "twinkleCrv" -p "guts_GP";
	rename -uid "52902239-4AF5-170E-174A-02A2A1025F4F";
createNode nurbsCurve -n "twinkleCrvShape" -p "twinkleCrv";
	rename -uid "1C97D6E7-4D07-28D7-7387-98A286892E26";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode nurbsCurve -n "twinkleCrvShapeOrig" -p "twinkleCrv";
	rename -uid "1CCA0CFA-4DE4-A9B6-018C-50841BAB4B7C";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		3 176 1 no 3
		181 0 0 0 1 2 3 4 5 5 5 6 6 6 7 8 8 8 9 9 9 10 10 10 11 11 11 12 13 13 13 14
		 14 14 15 16 16 16 17 17 17 18 19 20 20 20 21 21 21 22 23 24 25 25 25 26 26 26 27
		 28 29 29 29 30 30 30 31 32 33 33 33 34 34 34 35 36 37 38 38 38 39 39 39 40 41 42
		 42 42 43 43 43 44 45 46 46 46 47 47 47 48 49 50 51 51 51 52 52 52 53 54 54 54 55
		 55 55 56 57 57 57 58 58 58 59 60 61 61 61 62 62 62 63 64 65 66 67 67 67 68 68 68
		 69 70 70 70 71 71 71 72 73 74 75 76 76 76 77 77 77 78 79 80 80 80 81 81 81 82 83
		 84 85 85 85 86 86 86 87 88 89 89 89 90 90 90
		179
		0 -7.4987826179283159 3.9651782666946849
		0 -8.0711982677961558 4.2786567623725382
		0 -8.9503938166731913 4.6731824717269443
		0 -9.9796410183806898 5.6326796990769843
		0 -9.8740635201813305 5.9567837638790371
		0 -9.2576160887126662 5.5532420731614218
		0 -8.5808103900824975 5.1827629926464365
		0 -8.0593616137375292 4.712616927775847
		0 -5.7236157978543574 3.3007883457309064
		0 -3.3878699819711713 1.8889597636859587
		0 -1.0521241660879856 0.47713118164101065
		0 -1.0019801375771293 0.47730998844046324
		0 -0.90169208055532857 0.47766760203932829
		0 -0.91893139745680807 0.72645620880132156
		0 -0.92755105590754738 0.850850512182318
		0 -1.9137548448360064 3.8406051565127997
		0 -2.8999586337644643 6.8303598008432793
		0 -3.8101272263458821 9.804107035416493
		0 -3.663576599458251 9.7732542718612834
		0 -3.5170259725705684 9.7424015083059388
		0 -3.3704753456828929 9.7115487447506048
		0 -2.3705229154976077 6.7992165232981705
		0 -1.4466056816593689 3.9028917116030186
		0 -0.56345768246446948 1.6181054195579601
		0 -0.52825410871735601 1.4831213555495919
		0 -0.45784696122307572 1.2131532275327546
		0 -0.40368099853690148 1.5454079106397756
		0 -0.37659801719381419 1.7115352521932858
		0 -0.28392331997529424 3.6433643987271096
		0 -0.20157308540795793 5.0298307292090767
		0 -0.1496676228327769 7.5731983953929927
		0 -0.095482259707171835 7.8711112974389046
		0 0.012888466544073218 8.4669371015289965
		0 0.15366396065371368 7.9333978525285378
		0 0.22405170770853389 7.6666282280283031
		0 0.20328952267846245 5.1024983768143324
		0 0.15208256565623537 3.695269861302291
		0 0.13132038062616358 1.1311400100883029
		0 0.12602403068801291 1.0631137905586421
		0 0.11543133081169044 0.9270613514991437
		0 0.28322960048695045 0.72811980427874301
		0 0.38957863754715544 0.85146464627461105
		0 0.44275315607725702 0.91313706727254251
		0 3.2145048575919688 3.6329833062120724
		0 5.9862565591066819 6.3528295451516072
		0 8.7580082606213949 9.0726757840911407
		0 8.8982362950781386 9.2194352387328848
		0 9.1786923639888247 9.5129541480135185
		0 9.9085177397276567 9.9386009018241186
		0 9.8362206658772173 9.3732403314362305
		0 9.2419855058870937 8.94447993120869
		0 8.9448679258920158 8.7300997310949047
		0 6.3599758896479921 6.1971131574260623
		0 3.7750838534039333 3.6641265837571821
		0 1.1901918171598742 1.1311400100883029
		0 1.1368580683283145 1.038561656627758
		0 1.0301905706650181 0.85340494970650305
		0 1.1253211927350439 0.87895230830631066
		0 1.521525421196176 0.96402870270735286
		0 1.7196275354267381 1.0065668999078712
		0 4.4083304968211525 1.6398135433250862
		0 7.0970334582155745 2.2730601867423061
		0 9.7857364196099983 2.9063068301595258
		0 9.9124746836747022 2.9551545698925255
		0 10.165951211802877 3.0528500493581587
		0 10.791057764956724 2.9584816904717446
		0 10.598373790417304 2.7368387849929592
		0 10.502031803147561 2.6260173322535576
		0 7.5953258989373227 1.9927706888363239
		0 4.6886199947271345 1.3595240454191035
		0 1.7819140905169479 0.72627740200188295
		0 1.4755172433561854 0.62590466274797685
		0 1.0326975804836989 0.49906093704410204
		0 0.93784111557262084 0.30928028010774228
		0 1.1838830639496316 0.16089573776091887
		0 1.4956451236654831 0.088438951873698796
		0 1.9064872006973772 0.041125296009481276
		0 5.8097779863510652 -0.4986915147724103
		0 9.7130687720047462 -1.0385083255543022
		0 13.616359557658427 -1.5783251363361941
		0 13.81836278082953 -1.6099827191167475
		0 14.222369227169919 -1.6732978846776465
		0 14.17197686734694 -2.0473811649686313
		0 13.676992217374231 -1.96306118121115
		0 13.429499892387836 -1.9209011893324033
		0 9.5158280142190552 -1.3603221935204293
		0 5.6021561360503371 -0.79974319770846469
		0 2.2516688388946702 -0.65072216494449808
		0 1.9607919588108345 -0.63182976383518907
		0 1.3790381986429845 -0.59404496161654552
		0 1.3285956294517651 -0.72907846299560797
		0 1.9700418204920505 -1.1904122983728871
		0 1.9766812073702968 -1.2369611799611051
		0 3.2248859501070064 -2.3361448899338502
		0 5.6644426911405565 -4.2151226351554358
		0 8.057815183742612 -6.2448605546703444
		0 8.1418767103885372 -6.3402161082755306
		0 8.3099997636792935 -6.5309272154850859
		0 8.1601284536618373 -6.6669225139185428
		0 7.8950731555425309 -6.5717018092684585
		0 7.7492477777063824 -6.4628019523804632
		0 7.676335088788302 -6.4083520239364562
		0 5.1557691579037757 -4.5473175956366028
		0 2.8615477120807333 -2.7202453129901989
		0 0.56732626625769189 -0.89317303034379447
		0 0.53359118810254724 -0.95929930113772077
		0 0.46612103179219888 -1.09155184272548
		0 0.49206681804238167 -1.3745430017391436
		0 0.50503971116747293 -1.5160385812459747
		0 0.99295105937418437 -3.5714948992231825
		0 1.4808624075808947 -5.6269512172003884
		0 1.9687737557876055 -7.6824075351775925
		0 1.9756925678035797 -7.9998298497073419
		0 1.9895301918352535 -8.634674478765767
		0 1.7888329025328318 -8.0828785898272688
		0 1.6884842578816202 -7.8069806453580153
		0 1.1901918171598764 -5.7619054198958608
		0 0.69189937643812949 -3.7168301944336921
		0 0.19360693571638254 -1.6717549689715236
		0 0.13152533461538735 -1.5361361964720102
		0 0.0073621324133472908 -1.2648986514725427
		0 -0.15571887475216006 -1.3038558284003021
		0 -0.29655433164777711 -1.4245488119340206
		0 -0.36697206009558503 -1.4848953037008756
		0 -1.3220325714789294 -4.1216928025201112
		0 -2.2770930828622755 -6.7584903013393545
		0 -3.2321535942456219 -9.3952878001585969
		0 -3.3137125099390401 -9.6461185715973681
		0 -3.4768303413248791 -10.147780114472031
		0 -3.7196406615203168 -10.469909876154482
		0 -3.9034853234016982 -10.528542549721553
		0 -3.835142104015687 -9.7619176903118738
		0 -3.6615337994997734 -9.2475893581520623
		0 -3.5747296472418189 -8.9904251920721627
		0 -2.6611935059186238 -6.4470575258882628
		0 -1.7476573645954219 -3.9036898597043472
		0 -0.83412122327222038 -1.360322193520431
		0 -0.81611130567244317 -1.253679273979255
		0 -0.78009147047279037 -1.0403934348967436
		0 -0.98220878591299177 -0.96300868355818281
		0 -1.083267443633092 -0.92431630788890218
		0 -2.0694712325615501 -1.4329898411256865
		0 -3.0556750214900066 -1.9416633743624692
		0 -4.0418788104184626 -2.4503369075992518
		0 -4.1389111485383063 -2.5035190722881788
		0 -4.3329758247764216 -2.6098834016650758
		0 -4.8598910393849053 -2.8718474751748766
		0 -4.9534072716603985 -2.6308366869930682
		0 -4.7136427068493072 -2.3665237662863641
		0 -4.3073244792888836 -2.2147773435275573
		0 -4.1041653655086732 -2.1389041321481552
		0 -3.1491048541253335 -1.6509927839414493
		0 -2.1940443427419867 -1.1630814357347397
		0 -1.2389838313586399 -0.67517008752803009
		0 -1.2035810516127341 -0.64157080803167432
		0 -1.132775492120657 -0.57437224903881789
		0 -1.2924325111606789 -0.45635479355053421
		0 -1.3190866130495453 -0.43613417596161763
		0 -1.3324136639939745 -0.42602386716715795
		0 -4.1041653655086821 -0.50907260728744763
		0 -7.4663453310116354 -0.5606359196932077
		0 -9.4353991639520469 -0.61963378734685315
		0 -9.5366879820887398 -0.62468330068227451
		0 -9.7392656183595125 -0.63478232735293483
		0 -10.363039297191722 -0.53676167897822769
		0 -10.157075936342331 -0.4035978028528287
		0 -9.8087032903028355 -0.37062818955457522
		0 -9.6345169672830711 -0.354143382905448
		0 -7.6064652666890433 -0.33201918253533191
		0 -4.2183573831740828 -0.23916420189650212
		0 -1.3635569415390769 -0.20802092435139308
		0 -1.2563573496321101 -0.19081711419721112
		0 -1.0419581658176595 -0.15640949388876826
		0 -0.8966063515842948 -0.034646566546990568
		0 -1.0625714496769789 0.16120330370116792
		0 -1.1455539987233181 0.2591282388252471
		0 -3.2632968717907347 1.4944782481145762
		0 -5.3810397448581577 2.7298282574039061
		0 -7.4987826179255803 3.9651782666932363
		;
	setAttr ".dcv" yes;
createNode transform -n "baseCurve" -p "guts_GP";
	rename -uid "AD4383B8-4949-2653-1B04-8A8EB5EEAFFE";
createNode nurbsCurve -n "hardShape" -p "baseCurve";
	rename -uid "58914761-49D3-0079-C1D0-058C99AA8F63";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode nurbsCurve -n "softShape" -p "baseCurve";
	rename -uid "5DA5A067-4C0B-E972-7C23-A4AC1BBCDCCD";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 0 no 3
		13 0 0 0 1 2 3 4 5 6 7 8 8 8
		11
		0 -9 0
		-2.3026023190575514e-017 -6.0580566397782212 -0.051849994730450141
		-1.0587869647346897e-016 -3.4379192562565382 -0.23841762899219435
		-2.0984597532732783e-016 -2.4614477498717817 -0.47253112814467596
		-3.7588167216877185e-016 -1.853099551171759 -0.84641027935733992
		-5.8192013727096131e-016 -1.3103676566864455 -1.3103676566864446
		-8.2294151545337191e-016 -0.84641027935734392 -1.8530995511717585
		-1.0931023863277741e-015 -0.47253112814467652 -2.4614477498717817
		-1.5267428460392806e-015 -0.23841762899219787 -3.4379192562565373
		-2.6903175863860364e-015 -0.051849994730455512 -6.058056639778223
		-3.9968028886505635e-015 0 -9
		;
createNode nurbsCurve -n "hardShapeOrig" -p "baseCurve";
	rename -uid "DC0E5720-4826-7ED7-40E2-FD9DD902E15F";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-5.3290705182007514e-015 -1.3322676295501878e-015 -9
		0.0011104756650239425 -0.32620624086815203 -0.69478438428466205
		0.308 -2.5259999999999998 -2.6160000000000001
		0.0011104756650241192 -0.86440059014569415 -0.3315031985223213
		5.9164567891575894e-031 -9 1.332267629550188e-015
		;
createNode transform -n "emit_GP" -p "setupGP";
	rename -uid "EEC1AD9F-46BD-C204-2615-C1A9DA33FBFE";
	setAttr ".rp" -type "double3" -16.084320397452686 0 -23.643397167535902 ;
	setAttr ".sp" -type "double3" -16.084320397452686 0 -23.643397167535902 ;
createNode pointEmitter -n "emit" -p "emit_GP";
	rename -uid "DC31D5D3-4291-044B-E4ED-0488955D9B8D";
	setAttr ".emt" 4;
	setAttr ".sro" no;
	setAttr -l on ".urpp";
createNode transform -n "animGP" -p "root";
	rename -uid "77FEE9B6-4168-D0E0-3F80-E09CB5114905";
	setAttr ".rp" -type "double3" -2.68797853342073 1.9815202742400153 4.4408920985006262e-016 ;
	setAttr ".sp" -type "double3" -2.68797853342073 1.9815202742400153 4.4408920985006262e-016 ;
createNode transform -n "CTL_GP" -p "animGP";
	rename -uid "33A86BB0-453A-EB7C-F396-55A1A52C1A31";
	addAttr -ci true -sn "guts" -ln "guts" -min 0 -max 1 -at "long";
	addAttr -ci true -sn "scaleMultiplier" -ln "scaleMultiplier" -dv 0.1 -at "double";
	setAttr ".rp" -type "double3" -16.084320397452686 -2.4651903288156619e-032 -23.643397167535902 ;
	setAttr ".sp" -type "double3" -16.084320397452686 -2.4651903288156619e-032 -23.643397167535902 ;
	setAttr -k on ".guts";
	setAttr -k on ".scaleMultiplier";
createNode transform -n "CTL" -p "CTL_GP";
	rename -uid "53E6F865-4B34-BD40-229B-A692F96220A1";
	addAttr -ci true -sn "startFrame" -ln "startFrame" -at "long";
	addAttr -ci true -sn "endFrame" -ln "endFrame" -at "long";
	addAttr -ci true -sn "rate" -ln "rate" -at "double";
	addAttr -ci true -sn "speedAlong" -ln "speedAlong" -at "double";
	addAttr -ci true -sn "speedAround" -ln "speedAround" -at "double";
	addAttr -ci true -sn "speedAway" -ln "speedAway" -at "double";
	addAttr -ci true -sn "lifespan" -ln "lifespan" -at "double";
	addAttr -ci true -sn "lifeRandom" -ln "lifeRandom" -at "double";
	addAttr -ci true -sn "type" -ln "type" -min 0 -max 4 -en "sparkleA:sparkleB:sparkleC:shinyA:stars" 
		-at "enum";
	addAttr -ci true -sn "maxCount" -ln "maxCount" -at "long";
	addAttr -ci true -sn "speedRandom" -ln "speedRandom" -at "double";
	addAttr -ci true -sn "size" -ln "size" -at "double";
	addAttr -ci true -sn "sizeRandom" -ln "sizeRandom" -at "double";
	addAttr -ci true -sn "behaviour" -ln "behaviour" -min 0 -max 4 -en "Sparkle:Constant:RampDown:RampUp:Bumpy" 
		-at "enum";
	addAttr -ci true -sn "variety" -ln "variety" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "massOffset" -ln "massOffset" -at "double";
	addAttr -ci true -sn "gravity" -ln "gravity" -at "double";
	addAttr -ci true -sn "nts" -ln "notes" -dt "string";
	addAttr -ci true -sn "massRandomize" -ln "massRandomize" -at "double";
	addAttr -ci true -sn "spinSpeed" -ln "spinSpeed" -at "double";
	addAttr -ci true -sn "twist" -ln "twist" -at "double";
	addAttr -ci true -sn "blink" -ln "blink" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "timeScale" -ln "timeScale" -at "double";
	addAttr -ci true -sn "jumpTolerance" -ln "jumpTolerance" -dv 1 -at "double";
	addAttr -ci true -sn "particleB" -ln "particleB" -dv 1 -at "double";
	addAttr -ci true -sn "particleC" -ln "particleC" -at "double";
	addAttr -ci true -sn "growFor" -ln "growFor" -at "double";
	addAttr -ci true -sn "fps" -ln "fps" -min 0 -max 1 -en "24:30" -at "enum";
	addAttr -ci true -sn "emitterType" -ln "emitterType" -min 0 -max 4 -en "cube:sphere:cylainder:cone:torus" 
		-at "enum";
	addAttr -ci true -sn "volumeSweep" -ln "volumeSweep" -at "double";
	addAttr -ci true -sn "sectionRadius" -ln "sectionRadius" -at "double";
	addAttr -ci true -sn "color" -ln "color" -min 0 -max 1 -at "double";
	setAttr -k on ".startFrame" 10;
	setAttr -k on ".endFrame" 20;
	setAttr -k on ".rate" 2000;
	setAttr -k on ".speedAlong";
	setAttr -k on ".speedAround";
	setAttr -k on ".speedAway" 5;
	setAttr -k on ".lifespan" 2;
	setAttr -k on ".lifeRandom" 2;
	setAttr -k on ".type" 1;
	setAttr -k on ".maxCount" 1200;
	setAttr -k on ".speedRandom";
	setAttr -k on ".size" 1;
	setAttr -k on ".sizeRandom" 0.5;
	setAttr -k on ".behaviour" 4;
	setAttr -k on ".variety" 0.5;
	setAttr -k on ".massOffset" 10;
	setAttr -k on ".gravity" 5;
	setAttr ".nts" -type "string" (
		"float $id = shape.particleId;\nfloat $noise = `noise $id`;\nfloat $blink = CTL.blink;\nfloat $choice = CTL.type;\nfloat $variety = CTL.variety;\nfloat $sRandom = CTL.sizeRandom;\nfloat $timeScale = CTL.timeScale;\nfloat $spinSpeed = CTL.spinSpeed;\nfloat $massRandom = CTL.massRandomize;\nfloat $twist = (CTL.twist/ 180) * 3.1415;\nfloat $mass = motionMapper.outValuePP + ($noise * $massRandom);\nfloat $frame = frame;\nfloat $CTLsize = CTL.size + ($noise* $sRandom);\nfloat $lifespan = CTL.lifespan+($noise*CTL.lifeRandom);\nfloat $type = shape.typePP;\nvector $vel = shape.velocity;\nfloat $magVel = `mag $vel`;\nfloat $speed =  ($type / (80+$magVel));\nfloat $ageNormal = shape.ageNormalized;\nfloat $ageReverse = $ageNormal *-1+1;\nfloat $spin = shape.spinPP;\nfloat $inst, $add, $vis;\nfloat $size = shape.radiusPP * $CTLsize;\nfloat $val = (($frame*$speed)+$type);\nvector $scalePP, $aimUpPP;\nvector $aimVec = <<aimLoc.worldSpaceX,aimLoc.worldSpaceY,aimLoc.worldSpaceZ>>;\n\nif (abs(shape.magVelPP - $magVel) > CTL.jumpTolerance) $lifespan=0;\nif (($type / 10) >= $variety){$inst=0;}else{$inst=1;}\n"
		+ "if (abs(`noise($id+(($frame%(3/$timeScale))-$frame))`)>$blink){$vis=1;}else{$vis=0;}\n\nif ($choice == 0){\n\tfloat $sin = `sin ($val+ $ageNormal)`;\n\tfloat $cos = `cos ($val+ $ageReverse)`;\n\tif ($inst){$sin = 1; $cos = 1;}\n\t$scalePP = <<$size, ($size*$sin), ($size*$cos)>>;\n\t$aimUpPP = <<0,(`cos $twist`),(`sin $twist`)>>;}\nif ($choice == 1){\n\t$spin += ($ageReverse*($noise*($spinSpeed*0.1)));\n\t$add  = `sin (($frame*$noise)/12)`* ($ageNormal);\n\t$scalePP = <<$size, ($size*$add), ($size*$add)>>;\n\t$aimUpPP = `rot <<0,1,0>> <<1,0,0>> ($spin+$twist)`;}\nif ($choice == 2){\n\t$aimUpPP = `rot <<0,1,0>> <<1,0,0>> ($spin+$twist)`;\n\tif (shape.age > ($lifespan -0.2) && $inst==0){\n\t\t$size=$CTLsize*(`pow $ageNormal 3`);\n\t\tif (shape.age >($lifespan-0.1)){$inst=2;}else{$inst=1;$size*=0.3;}\n\t\t$mass=0;\n\t\t$add = 1;\n\t\t$vis = 1;\n\t}else{\n\t\t$spin += ($noise*($spinSpeed*0.1));\t\t\n\t\t$add = ($ageNormal + ($noise*$inst));}\n\t$scalePP = <<$size, ($size*$add), ($size*$add)>>;\n}\n\nshape.mass = $mass;\nshape.aimPP = $aimVec;\nshape.scalePP = $scalePP;\nshape.aimUpPP = $aimUpPP;\n"
		+ "shape.aimPP = $aimVec;\nshape.spinPP = $spin;\nshape.instPP = $inst;\nshape.visPP=$vis;\nshape.lifespanPP = $lifespan;\nshape.magVelPP = $magVel;");
	setAttr -k on ".massRandomize" 0.2;
	setAttr -k on ".spinSpeed" 2;
	setAttr -k on ".twist";
	setAttr -k on ".blink" 0.2;
	setAttr -k on ".timeScale" 1;
	setAttr -k on ".jumpTolerance" 30;
	setAttr -k on ".particleB" 0.5;
	setAttr -k on ".particleC" 30;
	setAttr -k on ".growFor" 0.5;
	setAttr -k on ".fps";
	setAttr -k on ".emitterType" 1;
	setAttr -k on ".volumeSweep" 360;
	setAttr -k on ".sectionRadius";
	setAttr -k on ".color" 0.37;
createNode nurbsCurve -n "CTLShape" -p "CTL";
	rename -uid "86D9242B-4393-93C6-494A-DE82CDD5FE69";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode transform -n "aimLoc" -p "CTL_GP";
	rename -uid "8E10087D-4869-A849-B95B-519AF13FC6DE";
	addAttr -ci true -sn "worldSpace" -ln "worldSpace" -at "double3" -nc 3;
	addAttr -ci true -sn "worldSpaceX" -ln "worldSpaceX" -at "double" -p "worldSpace";
	addAttr -ci true -sn "worldSpaceY" -ln "worldSpaceY" -at "double" -p "worldSpace";
	addAttr -ci true -sn "worldSpaceZ" -ln "worldSpaceZ" -at "double" -p "worldSpace";
	setAttr -k on ".worldSpace";
	setAttr -k on ".worldSpaceX";
	setAttr -k on ".worldSpaceY";
	setAttr -k on ".worldSpaceZ";
createNode locator -n "aimLocShape" -p "aimLoc";
	rename -uid "829868B9-46BB-6D3D-60D7-8CB4DC4B6920";
	setAttr -k off ".v";
createNode pointConstraint -n "aimLoc_pointConstraint1" -p "aimLoc";
	rename -uid "9BD28040-45A7-0EEE-A470-13A9F4B3C851";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "perspW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -5.5101410816283218 12.698105493825652 18.9660300035986 ;
	setAttr -k on ".w0";
createNode transform -s -n "persp";
	rename -uid "82152F31-491D-7329-82C3-D8AAE1A3D894";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -22.630506254682409 4.7064869473412614 15.045676371795551 ;
	setAttr ".r" -type "double3" -15.33835272960267 -55.400000000000475 -1.4002772369915461e-015 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "97B1DD12-438B-60A5-CECA-2BB6AC9C89FE";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 27.448703130757412;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "418FB7D1-44DB-432F-7F69-B987517EF9DA";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "A1ED8974-4EB5-4132-A872-6BA8A6339AA5";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "356C4DE5-4BDC-CA1B-A186-718753E8448A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "4D8C07A7-421A-B8FC-A213-9AAC17F76DAF";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "4B5B97B3-46EF-D2F6-5B71-06B8B7A56572";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "8206BFB3-4ECF-6904-FEBF-218B1B642BE7";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode arrayMapper -n "motionMapper";
	rename -uid "3AC70BF6-45A9-24D4-99AF-B7AAFB4CC768";
	addAttr -ci true -sn "input" -ln "input" -at "double3" -nc 3;
	addAttr -ci true -sn "inputX" -ln "inputX" -at "double" -p "input";
	addAttr -ci true -sn "inputY" -ln "inputY" -at "double" -p "input";
	addAttr -ci true -sn "inputZ" -ln "inputZ" -at "double" -p "input";
	setAttr -k on ".input";
	setAttr -k on ".inputX";
	setAttr -k on ".inputY";
	setAttr -k on ".inputZ";
createNode choice -n "valueChoice";
	rename -uid "61278CF2-42CB-0012-E06A-698EB6E8A088";
	addAttr -ci true -sn "sparkle" -ln "sparkle" -at "double3" -nc 3;
	addAttr -ci true -sn "sparkleX" -ln "sparkleX" -at "double" -p "sparkle";
	addAttr -ci true -sn "sparkleY" -ln "sparkleY" -at "double" -p "sparkle";
	addAttr -ci true -sn "sparkleZ" -ln "sparkleZ" -at "double" -p "sparkle";
	addAttr -ci true -sn "constant" -ln "constant" -at "double3" -nc 3;
	addAttr -ci true -sn "constantX" -ln "constantX" -at "double" -p "constant";
	addAttr -ci true -sn "constantY" -ln "constantY" -at "double" -p "constant";
	addAttr -ci true -sn "constantZ" -ln "constantZ" -at "double" -p "constant";
	addAttr -ci true -sn "rampUp" -ln "rampUp" -at "double3" -nc 3;
	addAttr -ci true -sn "rampUpX" -ln "rampUpX" -at "double" -p "rampUp";
	addAttr -ci true -sn "rampUpY" -ln "rampUpY" -at "double" -p "rampUp";
	addAttr -ci true -sn "rampUpZ" -ln "rampUpZ" -at "double" -p "rampUp";
	addAttr -ci true -sn "rampDown" -ln "rampDown" -at "double3" -nc 3;
	addAttr -ci true -sn "rampDownX" -ln "rampDownX" -at "double" -p "rampDown";
	addAttr -ci true -sn "rampDownY" -ln "rampDownY" -at "double" -p "rampDown";
	addAttr -ci true -sn "rampDownZ" -ln "rampDownZ" -at "double" -p "rampDown";
	addAttr -ci true -sn "Noisy" -ln "Noisy" -at "double3" -nc 3;
	addAttr -ci true -sn "NoisyX" -ln "NoisyX" -at "double" -p "Noisy";
	addAttr -ci true -sn "NoisyY" -ln "NoisyY" -at "double" -p "Noisy";
	addAttr -ci true -sn "NoisyZ" -ln "NoisyZ" -at "double" -p "Noisy";
	addAttr -ci true -sn "outVals" -ln "outVals" -at "double3" -nc 3;
	addAttr -ci true -sn "outValsX" -ln "outValsX" -at "double" -p "outVals";
	addAttr -ci true -sn "outValsY" -ln "outValsY" -at "double" -p "outVals";
	addAttr -ci true -sn "outValsZ" -ln "outValsZ" -at "double" -p "outVals";
	setAttr -s 5 ".i";
	setAttr -k on ".sparkle" -type "double3" 0.12 0.75 0.15 ;
	setAttr -k on ".sparkle";
	setAttr -k on ".sparkleX";
	setAttr -k on ".sparkleY";
	setAttr -k on ".sparkleZ";
	setAttr -k on ".constant" -type "double3" 0.98 0.99 1 ;
	setAttr -k on ".constant";
	setAttr -k on ".constantX";
	setAttr -k on ".constantY";
	setAttr -k on ".constantZ";
	setAttr -k on ".rampUp" -type "double3" 1 0.5 0 ;
	setAttr -k on ".rampUp";
	setAttr -k on ".rampUpX";
	setAttr -k on ".rampUpY";
	setAttr -k on ".rampUpZ";
	setAttr -k on ".rampDown" -type "double3" 0 0.5 1 ;
	setAttr -k on ".rampDown";
	setAttr -k on ".rampDownX";
	setAttr -k on ".rampDownY";
	setAttr -k on ".rampDownZ";
	setAttr -k on ".Noisy" -type "double3" -10 1 0.5 ;
	setAttr -k on ".Noisy";
	setAttr -k on ".NoisyX";
	setAttr -k on ".NoisyY";
	setAttr -k on ".NoisyZ";
	setAttr -k on ".outVals";
	setAttr -k on ".outValsX";
	setAttr -k on ".outValsY";
	setAttr -k on ".outValsZ";
createNode ramp -n "sparkleMove1";
	rename -uid "5AF5A2E8-4F18-1E8B-CEE1-40B7942FCA6A";
	setAttr ".dc" -type "float3" 0 0 0 ;
	setAttr ".in" 4;
	setAttr -s 3 ".cel";
	setAttr ".cel[0].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[1].ec" -type "float3" 0.42999923 0.42999923 0.42999923 ;
	setAttr ".cel[2].ec" -type "float3" 0 0 0 ;
	setAttr ".nf" 0.18531468510627747;
	setAttr ".vn" 0.10000000149011612;
	setAttr ".hnf" 0.20000000298023224;
	setAttr ".vnf" 0.25;
createNode condition -n "noiseCond";
	rename -uid "B69CFACD-456B-090E-4492-359F043D7565";
	setAttr ".op" 4;
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode plusMinusAverage -n "addEm";
	rename -uid "E3D7C82C-4DCB-4B6A-7BC6-72A28D21A62F";
	setAttr -s 3 ".i1";
	setAttr -s 3 ".i1";
createNode materialInfo -n "materialInfo1";
	rename -uid "F016C7E2-4C71-22A7-3842-FF878F5CC6BB";
createNode shadingEngine -n "nParticlePointsSE";
	rename -uid "4F80B24E-4621-F3F0-61A4-95B022753C02";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
createNode blinn -n "npPointsBlinn";
	rename -uid "53E2502F-4121-869E-2980-358594A5D5B9";
createNode particleSamplerInfo -n "particleSamplerInfo1";
	rename -uid "075B1057-40C2-C592-7232-E3B1702AE0DD";
createNode particleCloud -n "npPointsVolume";
	rename -uid "C68003E5-4165-8E88-EAA4-A7941EF7BD42";
createNode choice -n "minorChoice";
	rename -uid "330DA77E-466B-303E-EEBE-E3AA9D27E4FB";
	setAttr -s 4 ".i";
createNode polySphere -n "polySphere1";
	rename -uid "25BA1B60-45AD-0D6E-4AD1-A4B52EA97985";
	setAttr ".ax" -type "double3" 1 0 0 ;
	setAttr ".sa" 16;
	setAttr ".sh" 3;
createNode materialInfo -n "materialInfo3";
	rename -uid "F087D43B-477F-99A7-091F-EFABDEA9FD82";
createNode shadingEngine -n "ballShaderMTSG";
	rename -uid "D0032291-49A2-2758-F4FF-7EBB16A50444";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode surfaceShader -n "ballShaderMT";
	rename -uid "AF333F6E-4843-D0C0-D18E-61B7F36CC650";
	setAttr ".oc" -type "float3" 1 1 1 ;
createNode nurbsTessellate -n "tesselate";
	rename -uid "50FED56B-4A1E-C6CC-F2DE-EF9A0A7BB1AE";
	setAttr ".f" 2;
	setAttr ".pt" 1;
	setAttr ".chr" 0.9;
	setAttr ".ut" 1;
	setAttr ".un" 8;
	setAttr ".vt" 1;
	setAttr ".vn" 8;
	setAttr ".ucr" no;
	setAttr ".cht" 1;
createNode choice -n "starChoice";
	rename -uid "EB173370-4403-AB85-3C26-319CEF53DAC3";
	setAttr -s 5 ".i";
createNode dpBirailSrf -n "birail";
	rename -uid "B0FA0929-471E-15C3-9820-3C9EC3E2F021";
createNode planarTrimSurface -n "twinkletrim";
	rename -uid "BC718477-43A5-E346-0594-6889C76ECC41";
	setAttr ".d" 1;
createNode planarTrimSurface -n "starTrim";
	rename -uid "2663832D-403C-9A31-4C9D-8B9D3FFE3D8C";
	setAttr ".d" 1;
createNode materialInfo -n "materialInfo2";
	rename -uid "75AD56D0-4470-0E30-FC82-3BB9E07CE1A9";
createNode shadingEngine -n "goldShaderMTSG";
	rename -uid "790A8D50-42A5-E8C1-9585-A19AFCBF4CD3";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode surfaceShader -n "goldShaderMT";
	rename -uid "C7381E0C-4905-80E1-EFD6-C19625BAE24C";
createNode ramp -n "ramp2";
	rename -uid "706FB21B-4E5C-8DE5-BAFB-57A843C1DEDE";
	setAttr ".t" 6;
	setAttr -s 2 ".cel";
	setAttr ".cel[0].ep" 0.73968255519866943;
	setAttr ".cel[1].ep" 0.508583664894104;
	setAttr ".cel[1].ec" -type "float3" 1 1 0.87450981 ;
createNode place2dTexture -n "place2dTexture2";
	rename -uid "81CEB930-4620-CE5E-1504-A39C32EAA892";
createNode remapHsv -n "remapHsv1";
	rename -uid "85771672-4868-B1C4-4E40-438EAAF29CA4";
	setAttr -s 2 ".h[0:1]"  0 0.50880265 1 1 1 1;
	setAttr -s 2 ".s[0:1]"  0 1 1 1 1 1;
	setAttr -s 3 ".v[0:2]"  0 0.5 2 0.46956521 1 2 1 0.5 3;
createNode remapValue -n "remapValue1";
	rename -uid "438B9618-494A-A474-B95B-FFBB735A7980";
	setAttr -s 4 ".vl[1:4]"  0.61619049 1 0 0.88 0.16518848 1 0.12
		 0.3880266 0 0.38 0.78492242 0;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode ramp -n "ramp1";
	rename -uid "77DD2469-4506-F146-9484-C8974EEFA57F";
	setAttr ".t" 3;
	setAttr -s 2 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[1].ep" 1;
	setAttr ".cel[1].ec" -type "float3" 1 1 1 ;
createNode place2dTexture -n "place2dTexture1";
	rename -uid "F432C2CE-4E04-D4EA-9EDF-E78D18E0B332";
	setAttr ".mu" yes;
	setAttr ".mv" yes;
createNode plusMinusAverage -n "plusMinusAverage1";
	rename -uid "B9CAF773-446C-7C60-D529-4AAD79B63725";
	setAttr -s 2 ".i3[0:1]" -type "float3"  0.37 0.37 0 0.1 0.2 0;
createNode ramp -n "ramp3";
	rename -uid "4E2858AE-4C9B-4B60-2C0D-F6939B7EB830";
	setAttr ".t" 5;
	setAttr -s 2 ".cel";
	setAttr ".cel[0].ep" 0.77896994352340698;
	setAttr ".cel[0].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[1].ep" 1;
	setAttr ".cel[1].ec" -type "float3" 1 1 1 ;
createNode reverse -n "reverse1";
	rename -uid "F0FB4FA2-4C30-A2A5-FEC7-9BBFBF603E81";
createNode materialInfo -n "materialInfo4";
	rename -uid "0E2A9701-45B2-FBA6-44F9-099735BFAB51";
createNode shadingEngine -n "shinyMTSG";
	rename -uid "F5F6132D-4AAB-9CE4-BFF9-42BB0781C942";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode surfaceShader -n "shinyMT";
	rename -uid "CD4170D7-450D-B93A-C4E8-DA925CB2EAEF";
createNode multiplyDivide -n "multiplyDivide1";
	rename -uid "6ADC3A21-47FB-4C63-C3DE-D7AA4836321A";
createNode ramp -n "ramp4";
	rename -uid "BAD5ED58-49E9-4DE7-3A9B-529936120CE1";
	setAttr ".co" -type "float3" 0.66083771 0.66083771 0.66083771 ;
	setAttr -s 3 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 1 0 0 ;
	setAttr ".cel[1].ep" 0.5;
	setAttr ".cel[1].ec" -type "float3" 1 1 0 ;
	setAttr ".cel[2].ep" 1;
	setAttr ".cel[2].ec" -type "float3" 0 0 1 ;
createNode place2dTexture -n "place2dTexture3";
	rename -uid "073E23CC-4BB7-74B5-4A58-0D8A31EBCBED";
createNode samplerInfo -n "samplerInfo1";
	rename -uid "F1A6A18B-4758-7389-F1C0-7E9C8B1A8373";
createNode reverse -n "reverse2";
	rename -uid "4720EDDB-4AAF-ECFA-01A5-70BB0F5C2678";
createNode remapValue -n "remapValue2";
	rename -uid "1FCCB5FA-4AAE-723B-7184-DCA712D03BE4";
	setAttr -s 2 ".vl[0:1]"  0 0 1 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0.97419357299804688;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 0.94999998807907104;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode makeNurbCircle -n "makeNurbCircle2";
	rename -uid "E83530FB-4DE8-84E4-022B-61BF72744C12";
	setAttr ".nr" -type "double3" 1 0 0 ;
	setAttr ".r" 4;
	setAttr ".d" 1;
	setAttr ".s" 10;
createNode choice -n "starChoice1";
	rename -uid "29E5E132-468D-0993-3AEB-F395C8D6D2AE";
	setAttr -s 3 ".i";
createNode condition -n "ifGate";
	rename -uid "87C95DE4-4758-84DE-3EFA-068948555B21";
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode condition -n "ifStart";
	rename -uid "190E48E9-4890-B266-FEC6-C2932C573594";
	setAttr ".op" 5;
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode choice -n "timeChoice";
	rename -uid "AB8FD61A-490C-D7A2-7F48-F98ED7435835";
	setAttr -s 2 ".i";
createNode timeToUnitConversion -n "timetoUnit24";
	rename -uid "13D76939-48E9-A314-1C8B-03A00D8B48A8";
	setAttr ".cf" 0.004;
createNode timeToUnitConversion -n "timetoUnit30";
	rename -uid "63A8E02A-45DB-4768-A9E4-058B81CE8A59";
	setAttr ".cf" 0.005;
createNode condition -n "ifEnd";
	rename -uid "7335077A-48B5-DDD2-8E68-5BA71A94B345";
	setAttr ".op" 3;
	setAttr ".ct" -type "float3" 1 0 0 ;
	setAttr ".cf" -type "float3" 0 1 1 ;
createNode unitConversion -n "unitConversion1";
	rename -uid "0623B3D1-44A8-7FD8-9E74-039CF12528CA";
	setAttr ".cf" 0.017453292519943295;
createNode makeNurbCircle -n "makeNurbCircle1";
	rename -uid "C5A48375-4242-8DBD-B0D5-FCB22E7EE553";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 2;
createNode pointMatrixMult -n "pointMatrixMult1";
	rename -uid "1C1C40FD-4E83-A3B6-7D90-CD83F5FAF246";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "1A647450-45F2-C221-B978-EB9E269A2730";
	setAttr -s 6 ".lnk";
	setAttr -s 6 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "BC49B078-4D42-C6B7-7D66-46A2926A811C";
createNode displayLayer -n "defaultLayer";
	rename -uid "C064C4F9-46DA-2010-AC13-97AA55801375";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "0273326F-4A00-D6AA-EB58-6A874FEB4620";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "1E589E94-4126-5241-6C6C-58B4D83EE01C";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "5C407291-4023-0714-8E45-EB8EE0CA4691";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n"
		+ "        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n"
		+ "                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n"
		+ "                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n"
		+ "            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n"
		+ "            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n"
		+ "                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n"
		+ "            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n"
		+ "            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n"
		+ "                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n"
		+ "                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 0\n                -imagePlane 1\n                -joints 1\n"
		+ "                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1127\n                -height 486\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n"
		+ "            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1127\n            -height 486\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 0\n                -showConnected 1\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 1\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n"
		+ "                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n"
		+ "                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n"
		+ "                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n"
		+ "                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"profilerPanel\" -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n"
		+ "                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n"
		+ "                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n"
		+ "                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n"
		+ "                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1127\\n    -height 486\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1127\\n    -height 486\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "6C236047-459A-D073-0250-69887C419573";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 150 -ast 1 -aet 250 ";
	setAttr ".st" 6;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "4DEBDA81-4E6C-F061-7B9C-56B592940001";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -418.52118401587063 -1250.0372844447061 ;
	setAttr ".tgi[0].vh" -type "double2" 2456.8892508742961 272.35744090036781 ;
	setAttr -s 35 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 1060;
	setAttr ".tgi[0].ni[0].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 1670;
	setAttr ".tgi[0].ni[1].y" -2142.857177734375;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 1408.5714111328125;
	setAttr ".tgi[0].ni[2].y" -2208.571533203125;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 485.71429443359375;
	setAttr ".tgi[0].ni[3].y" -1035.7142333984375;
	setAttr ".tgi[0].ni[3].nvs" 18306;
	setAttr ".tgi[0].ni[4].x" 485.71429443359375;
	setAttr ".tgi[0].ni[4].y" -477.14285278320312;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 1931.4285888671875;
	setAttr ".tgi[0].ni[5].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" 1207.5560302734375;
	setAttr ".tgi[0].ni[6].y" -410.51724243164062;
	setAttr ".tgi[0].ni[6].nvs" 18305;
	setAttr ".tgi[0].ni[7].x" 1060;
	setAttr ".tgi[0].ni[7].y" -2495.71435546875;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" 1060;
	setAttr ".tgi[0].ni[8].y" -730;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" 781.4285888671875;
	setAttr ".tgi[0].ni[9].y" -225.71427917480469;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" 781.4285888671875;
	setAttr ".tgi[0].ni[10].y" -2878.571533203125;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" 485.71429443359375;
	setAttr ".tgi[0].ni[11].y" -2495.71435546875;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" 1670;
	setAttr ".tgi[0].ni[12].y" -2640;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" 1408.5714111328125;
	setAttr ".tgi[0].ni[13].y" -2640;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" 2352.857177734375;
	setAttr ".tgi[0].ni[14].y" -2978.571533203125;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" 485.71429443359375;
	setAttr ".tgi[0].ni[15].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" 1060;
	setAttr ".tgi[0].ni[16].y" -412.85714721679687;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" 781.4285888671875;
	setAttr ".tgi[0].ni[17].y" -2691.428466796875;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" 1408.5714111328125;
	setAttr ".tgi[0].ni[18].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" 781.4285888671875;
	setAttr ".tgi[0].ni[19].y" -412.85714721679687;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" 1060;
	setAttr ".tgi[0].ni[20].y" -225.71427917480469;
	setAttr ".tgi[0].ni[20].nvs" 18304;
	setAttr ".tgi[0].ni[21].x" 490.44140625;
	setAttr ".tgi[0].ni[21].y" -1569.1214599609375;
	setAttr ".tgi[0].ni[21].nvs" 18305;
	setAttr ".tgi[0].ni[22].x" 485.71429443359375;
	setAttr ".tgi[0].ni[22].y" -2878.571533203125;
	setAttr ".tgi[0].ni[22].nvs" 18304;
	setAttr ".tgi[0].ni[23].x" 781.4285888671875;
	setAttr ".tgi[0].ni[23].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[23].nvs" 18304;
	setAttr ".tgi[0].ni[24].x" 1670;
	setAttr ".tgi[0].ni[24].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[24].nvs" 18304;
	setAttr ".tgi[0].ni[25].x" 1408.5714111328125;
	setAttr ".tgi[0].ni[25].y" -2078.571533203125;
	setAttr ".tgi[0].ni[25].nvs" 18304;
	setAttr ".tgi[0].ni[26].x" 781.4285888671875;
	setAttr ".tgi[0].ni[26].y" -2301.428466796875;
	setAttr ".tgi[0].ni[26].nvs" 18304;
	setAttr ".tgi[0].ni[27].x" 104.24337005615234;
	setAttr ".tgi[0].ni[27].y" -54.397369384765625;
	setAttr ".tgi[0].ni[27].nvs" 18305;
	setAttr ".tgi[0].ni[28].x" 781.4285888671875;
	setAttr ".tgi[0].ni[28].y" -542.85711669921875;
	setAttr ".tgi[0].ni[28].nvs" 18304;
	setAttr ".tgi[0].ni[29].x" 781.4285888671875;
	setAttr ".tgi[0].ni[29].y" -2561.428466796875;
	setAttr ".tgi[0].ni[29].nvs" 18304;
	setAttr ".tgi[0].ni[30].x" 1408.5714111328125;
	setAttr ".tgi[0].ni[30].y" -641.4285888671875;
	setAttr ".tgi[0].ni[30].nvs" 18304;
	setAttr ".tgi[0].ni[31].x" 1931.4285888671875;
	setAttr ".tgi[0].ni[31].y" -2640;
	setAttr ".tgi[0].ni[31].nvs" 18304;
	setAttr ".tgi[0].ni[32].x" 781.4285888671875;
	setAttr ".tgi[0].ni[32].y" -2431.428466796875;
	setAttr ".tgi[0].ni[32].nvs" 18304;
	setAttr ".tgi[0].ni[33].x" 485.71429443359375;
	setAttr ".tgi[0].ni[33].y" -131.42857360839844;
	setAttr ".tgi[0].ni[33].nvs" 18304;
	setAttr ".tgi[0].ni[34].x" 822.1121826171875;
	setAttr ".tgi[0].ni[34].y" -1203.442138671875;
	setAttr ".tgi[0].ni[34].nvs" 18305;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 106;
	setAttr -av ".unw" 106;
	setAttr -k on ".etw" yes;
	setAttr -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -av ".aoam";
	setAttr -k on ".mbsof";
	setAttr ".msaa" yes;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 6 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 9 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 23 ".u";
select -ne :defaultRenderingList1;
select -ne :defaultTextureList1;
	setAttr -s 5 ".tx";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -k on ".mico";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -k on ".micr";
	setAttr -k on ".micg";
	setAttr -k on ".micb";
	setAttr -cb on ".mica";
	setAttr -av -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -k on ".mico";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -k on ".micr";
	setAttr -k on ".micg";
	setAttr -k on ".micb";
	setAttr -cb on ".mica";
	setAttr -av -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :defaultRenderGlobals;
	setAttr ".mcfr" 30;
	setAttr ".ren" -type "string" "mentalRay";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -k on ".isu";
	setAttr -k on ".pdu";
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k off ".ctrs" 256;
	setAttr -av -k off ".btrs" 512;
	setAttr -k off -cb on ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off -cb on ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr" 30;
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "shape.idt[0].ipd" "inst.inp";
connectAttr "star.m" "inst.inh[0]";
connectAttr "ball.m" "inst.inh[1]";
connectAttr "blink.m" "inst.inh[2]";
connectAttr "shiny.m" "inst.inh[3]";
connectAttr "CTL.lifespan" "shape.lifespan";
connectAttr "shape.xo[10]" "shape.typePP";
connectAttr "shape.xo[4]" "shape.scalePP";
connectAttr "shape.xo[6]" "shape.instPP";
connectAttr "shape.xo[5]" "shape.aimUpPP";
connectAttr "shape.xo[11]" "shape.aimAxisPP";
connectAttr "shape.xo[0]" "shape.spinPP";
connectAttr "shape.xo[7]" "shape.visPP";
connectAttr ":time1.o" "shape.cti";
connectAttr "nuke.noao[0]" "shape.nxst";
connectAttr "nuke.stf" "shape.stf";
connectAttr "emit.ot[0]" "shape.npt[0]";
connectAttr "shape.vel" "shape.xi[0]";
connectAttr "shape.pos" "shape.xi[1]";
connectAttr "CTL_GP.scaleMultiplier" "shape.xi[2]";
connectAttr "shape.id" "shape.xi[3]";
connectAttr "CTL.blink" "shape.xi[4]";
connectAttr "CTL.type" "shape.xi[5]";
connectAttr "CTL.variety" "shape.xi[6]";
connectAttr "CTL.sizeRandom" "shape.xi[7]";
connectAttr "CTL.timeScale" "shape.xi[8]";
connectAttr "CTL.spinSpeed" "shape.xi[9]";
connectAttr "CTL.massRandomize" "shape.xi[10]";
connectAttr "CTL.growFor" "shape.xi[11]";
connectAttr "CTL.twist" "shape.xi[12]";
connectAttr "motionMapper.ovpp" "shape.xi[13]";
connectAttr "CTL.size" "shape.xi[14]";
connectAttr "CTL.lifespan" "shape.xi[15]";
connectAttr "CTL.lifeRandom" "shape.xi[16]";
connectAttr "shape.ageNormalized" "shape.xi[17]";
connectAttr "CTL.particleB" "shape.xi[18]";
connectAttr "shape.ag" "shape.xi[19]";
connectAttr "shape.radiusPP" "shape.xi[20]";
connectAttr "aimLoc.worldSpaceX" "shape.xi[21]";
connectAttr "aimLoc.worldSpaceY" "shape.xi[22]";
connectAttr "aimLoc.worldSpaceZ" "shape.xi[23]";
connectAttr "CTL.jumpTolerance" "shape.xi[24]";
connectAttr "shape.inrr" "shape.radiusPP";
connectAttr "shape.xo[2]" "shape.mas";
connectAttr "CTL.maxCount" "shape.mxc";
connectAttr "CTL.lifeRandom" "shape.lfr";
connectAttr "aimLoc.wm" "shape.ggeo[0]";
connectAttr ":time1.o" "shape.tim";
connectAttr "shape.xo[9]" "shape.babyEmitterRatePP";
connectAttr "shape.xo[1]" "shape.magVelPP";
connectAttr "shape.xo[3]" "shape.aimPP";
connectAttr "shape.xo[8]" "shape.lifespanPP";
connectAttr "CTL.massOffset" "shape.pmss";
connectAttr ":time1.o" "emitB.ct";
connectAttr "shape.cwcn" "emitB.ocd";
connectAttr "shape.ctd" "emitB.t";
connectAttr "shape.cwps" "emitB.opd";
connectAttr "shape.cwvl" "emitB.ovd";
connectAttr "shape.id" "emitB.paid";
connectAttr "baby.ifl" "emitB.full[0]";
connectAttr "baby.tss" "emitB.dt[0]";
connectAttr "baby.inh" "emitB.inh[0]";
connectAttr "baby.stt" "emitB.stt[0]";
connectAttr "baby.sd[0]" "emitB.sd[0]";
connectAttr "shape.babyEmitterRatePP" "emitB.rpp";
connectAttr "shape.babyEmitterRemainderPP" "emitB.ecr[0]";
connectAttr ":time1.o" "baby.cti";
connectAttr "nukeB.noao[0]" "baby.nxst";
connectAttr "nukeB.stf" "baby.stf";
connectAttr "emitB.ot[0]" "baby.npt[0]";
connectAttr "baby.xo[0]" "baby.mas";
connectAttr "baby.id" "baby.xi[0]";
connectAttr ":time1.o" "emitC.ct";
connectAttr "baby.cwcn" "emitC.ocd";
connectAttr "baby.ctd" "emitC.t";
connectAttr "baby.cwps" "emitC.opd";
connectAttr "baby.cwvl" "emitC.ovd";
connectAttr "baby.id" "emitC.paid";
connectAttr "twinkles.ifl" "emitC.full[0]";
connectAttr "twinkles.tss" "emitC.dt[0]";
connectAttr "twinkles.inh" "emitC.inh[0]";
connectAttr "twinkles.stt" "emitC.stt[0]";
connectAttr "twinkles.sd[0]" "emitC.sd[0]";
connectAttr "CTL.particleC" "emitC.rat";
connectAttr ":time1.o" "twinkles.cti";
connectAttr "nuke.noao[2]" "twinkles.nxst";
connectAttr "nuke.stf" "twinkles.stf";
connectAttr "emitC.ot[0]" "twinkles.npt[0]";
connectAttr "CTL_GP.guts" "guts_GP.v";
connectAttr "CTL.startFrame" "nuke.stf";
connectAttr ":time1.o" "nuke.cti";
connectAttr "shape.cust" "nuke.niao[0]";
connectAttr "twinkles.cust" "nuke.niao[2]";
connectAttr "shape.stst" "nuke.nias[0]";
connectAttr "twinkles.stst" "nuke.nias[2]";
connectAttr "CTL.gravity" "nuke.grty";
connectAttr "CTL.timeScale" "nuke.tisc";
connectAttr "CTL.startFrame" "nukeB.stf";
connectAttr ":time1.o" "nukeB.cti";
connectAttr "baby.stst" "nukeB.nias[0]";
connectAttr "baby.cust" "nukeB.niao[0]";
connectAttr "CTL.gravity" "nukeB.grty";
connectAttr "CTL.timeScale" "nukeB.tisc";
connectAttr "minorChoice.o" "ballShape.i";
connectAttr "tesselate.op" "starShape.i";
connectAttr "makeNurbCircle2.oc" "star1Shape.cr";
connectAttr "starChoice1.o" "curveShape2.cr";
connectAttr "starChoice1.o" "curveShape3.cr";
connectAttr "starChoice1.o" "curveShape4.cr";
connectAttr "starChoice1.o" "curveShape5.cr";
connectAttr "twinkleCrvShapeOrig.ws" "twinkleCrvShape.cr";
connectAttr "hardShapeOrig.ws" "hardShape.cr";
connectAttr "CTL_GP.t" "emit_GP.t";
connectAttr "CTL_GP.r" "emit_GP.r";
connectAttr "CTL_GP.s" "emit_GP.s";
connectAttr ":time1.o" "emit.ct";
connectAttr "shape.ifl" "emit.full[0]";
connectAttr "shape.tss" "emit.dt[0]";
connectAttr "shape.inh" "emit.inh[0]";
connectAttr "shape.stt" "emit.stt[0]";
connectAttr "shape.sd[0]" "emit.sd[0]";
connectAttr "ifGate.ocr" "emit.rat";
connectAttr "CTL.speedAlong" "emit.alx";
connectAttr "CTL.speedAway" "emit.afa";
connectAttr "CTL.speedAway" "emit.afc";
connectAttr "CTL.speedAround" "emit.arx";
connectAttr "CTL.speedAway" "emit.spd";
connectAttr "CTL.speedRandom" "emit.srnd";
connectAttr "CTL.t" "emit.t";
connectAttr "CTL.r" "emit.r";
connectAttr "CTL.s" "emit.s";
connectAttr "CTL.emitterType" "emit.vol";
connectAttr "unitConversion1.o" "emit.vsw";
connectAttr "CTL.sectionRadius" "emit.vsr";
connectAttr "makeNurbCircle1.oc" "CTLShape.cr";
connectAttr "pointMatrixMult1.o" "aimLoc.worldSpace";
connectAttr "aimLoc_pointConstraint1.ctx" "aimLoc.tx";
connectAttr "aimLoc_pointConstraint1.cty" "aimLoc.ty";
connectAttr "aimLoc_pointConstraint1.ctz" "aimLoc.tz";
connectAttr "aimLoc.pim" "aimLoc_pointConstraint1.cpim";
connectAttr "aimLoc.rp" "aimLoc_pointConstraint1.crp";
connectAttr "aimLoc.rpt" "aimLoc_pointConstraint1.crt";
connectAttr ":persp.t" "aimLoc_pointConstraint1.tg[0].tt";
connectAttr ":persp.rp" "aimLoc_pointConstraint1.tg[0].trp";
connectAttr ":persp.rpt" "aimLoc_pointConstraint1.tg[0].trt";
connectAttr ":persp.pm" "aimLoc_pointConstraint1.tg[0].tpm";
connectAttr "aimLoc_pointConstraint1.w0" "aimLoc_pointConstraint1.tg[0].tw";
connectAttr "valueChoice.o" "motionMapper.input";
connectAttr "sparkleMove1.msg" "motionMapper.cn";
connectAttr "sparkleMove1.oc" "motionMapper.cnc";
connectAttr "shape.ageNormalized" "motionMapper.vpp";
connectAttr "shape.uValPP" "motionMapper.upp";
connectAttr "valueChoice.sparkle" "valueChoice.i[0]";
connectAttr "valueChoice.constant" "valueChoice.i[1]";
connectAttr "valueChoice.rampUp" "valueChoice.i[2]";
connectAttr "valueChoice.rampDown" "valueChoice.i[3]";
connectAttr "valueChoice.Noisy" "valueChoice.i[4]";
connectAttr "CTL.behaviour" "valueChoice.s";
connectAttr "valueChoice.o" "valueChoice.outVals";
connectAttr "valueChoice.outValsX" "sparkleMove1.cel[0].ep";
connectAttr "valueChoice.outValsY" "sparkleMove1.cel[1].ep";
connectAttr "valueChoice.outValsZ" "sparkleMove1.cel[2].ep";
connectAttr "noiseCond.ocr" "sparkleMove1.n";
connectAttr "addEm.o1" "noiseCond.ft";
connectAttr "motionMapper.inputX" "addEm.i1[0]";
connectAttr "motionMapper.inputY" "addEm.i1[1]";
connectAttr "motionMapper.inputZ" "addEm.i1[2]";
connectAttr "nParticlePointsSE.msg" "materialInfo1.sg";
connectAttr "npPointsBlinn.msg" "materialInfo1.m";
connectAttr "particleSamplerInfo1.msg" "materialInfo1.t" -na;
connectAttr "npPointsBlinn.oc" "nParticlePointsSE.ss";
connectAttr "npPointsVolume.oi" "nParticlePointsSE.vs";
connectAttr "shape.iog" "nParticlePointsSE.dsm" -na;
connectAttr "baby.iog" "nParticlePointsSE.dsm" -na;
connectAttr "twinkles.iog" "nParticlePointsSE.dsm" -na;
connectAttr "particleSamplerInfo1.oc" "npPointsBlinn.c";
connectAttr "particleSamplerInfo1.ot" "npPointsBlinn.it";
connectAttr "particleSamplerInfo1.oi" "npPointsBlinn.ic";
connectAttr "particleSamplerInfo1.ot" "npPointsVolume.t";
connectAttr "particleSamplerInfo1.oc" "npPointsVolume.c";
connectAttr "particleSamplerInfo1.oi" "npPointsVolume.i";
connectAttr "polySphere1.out" "minorChoice.i[0]";
connectAttr "polySphere1.out" "minorChoice.i[1]";
connectAttr "basicShape.o" "minorChoice.i[2]";
connectAttr "polySphere1.out" "minorChoice.i[3]";
connectAttr "CTL.type" "minorChoice.s";
connectAttr "ballShaderMTSG.msg" "materialInfo3.sg";
connectAttr "ballShaderMT.msg" "materialInfo3.m";
connectAttr "ballShaderMT.msg" "materialInfo3.t" -na;
connectAttr "ballShaderMT.oc" "ballShaderMTSG.ss";
connectAttr "ballShape.iog" "ballShaderMTSG.dsm" -na;
connectAttr "starChoice.o" "tesselate.is";
connectAttr "birail.os" "starChoice.i[0]";
connectAttr "twinkletrim.os" "starChoice.i[1]";
connectAttr "birail.os" "starChoice.i[2]";
connectAttr "birail.os" "starChoice.i[3]";
connectAttr "starTrim.os" "starChoice.i[4]";
connectAttr "CTL.type" "starChoice.s";
connectAttr "curveShape2.ws" "birail.ip1";
connectAttr "curveShape4.ws" "birail.ip2";
connectAttr "curveShape3.ws" "birail.ir1";
connectAttr "curveShape5.ws" "birail.ir2";
connectAttr "twinkleCrvShape.ws" "twinkletrim.ic[0]";
connectAttr "star1Shape.ws" "starTrim.ic[0]";
connectAttr "goldShaderMTSG.msg" "materialInfo2.sg";
connectAttr "goldShaderMT.msg" "materialInfo2.m";
connectAttr "goldShaderMT.msg" "materialInfo2.t" -na;
connectAttr "goldShaderMT.oc" "goldShaderMTSG.ss";
connectAttr "starShape.iog" "goldShaderMTSG.dsm" -na;
connectAttr "blinkShape.iog" "goldShaderMTSG.dsm" -na;
connectAttr "ramp2.oc" "goldShaderMT.oc";
connectAttr "ramp3.oc" "goldShaderMT.ot";
connectAttr "reverse1.o" "goldShaderMT.omo";
connectAttr "place2dTexture2.o" "ramp2.uv";
connectAttr "place2dTexture2.ofs" "ramp2.fs";
connectAttr "remapHsv1.oc" "ramp2.cel[0].ec";
connectAttr "remapValue1.ov" "remapHsv1.h[0].hfv";
connectAttr "ramp1.oc" "remapHsv1.cl";
connectAttr "ramp1.ocr" "remapValue1.i";
connectAttr "plusMinusAverage1.o3x" "remapValue1.omn";
connectAttr "plusMinusAverage1.o3y" "remapValue1.omx";
connectAttr "place2dTexture1.o" "ramp1.uv";
connectAttr "place2dTexture1.ofs" "ramp1.fs";
connectAttr "CTL.color" "plusMinusAverage1.i3[0].i3x";
connectAttr "CTL.color" "plusMinusAverage1.i3[0].i3y";
connectAttr "place2dTexture1.o" "ramp3.uv";
connectAttr "place2dTexture1.ofs" "ramp3.fs";
connectAttr "ramp3.oc" "reverse1.i";
connectAttr "shinyMTSG.msg" "materialInfo4.sg";
connectAttr "shinyMT.msg" "materialInfo4.m";
connectAttr "shinyMT.msg" "materialInfo4.t" -na;
connectAttr "shinyMT.oc" "shinyMTSG.ss";
connectAttr "shinyShape.iog" "shinyMTSG.dsm" -na;
connectAttr "multiplyDivide1.o" "shinyMT.oc";
connectAttr "remapValue2.oc" "shinyMT.ot";
connectAttr "reverse2.o" "shinyMT.omo";
connectAttr "ramp4.oc" "multiplyDivide1.i1";
connectAttr "reverse2.o" "multiplyDivide1.i2";
connectAttr "place2dTexture3.ov" "ramp4.v";
connectAttr "samplerInfo1.fr" "ramp4.u";
connectAttr "place2dTexture3.ofs" "ramp4.fs";
connectAttr "remapValue2.oc" "reverse2.i";
connectAttr "samplerInfo1.fr" "remapValue2.i";
connectAttr "softShape.ws" "starChoice1.i[0]";
connectAttr "hardShape.ws" "starChoice1.i[2]";
connectAttr "softShape.ws" "starChoice1.i[4]";
connectAttr "CTL.type" "starChoice1.s";
connectAttr "ifStart.ocr" "ifGate.ft";
connectAttr "ifEnd.ocr" "ifGate.st";
connectAttr "CTL.rate" "ifGate.ctr";
connectAttr "timeChoice.o" "ifStart.ft";
connectAttr "CTL.startFrame" "ifStart.st";
connectAttr "CTL.fps" "timeChoice.s";
connectAttr "timetoUnit24.o" "timeChoice.i[0]";
connectAttr "timetoUnit30.o" "timeChoice.i[1]";
connectAttr ":time1.o" "timetoUnit24.i";
connectAttr ":time1.o" "timetoUnit30.i";
connectAttr "timeChoice.o" "ifEnd.ft";
connectAttr "CTL.endFrame" "ifEnd.st";
connectAttr "CTL.volumeSweep" "unitConversion1.i";
connectAttr "aimLoc.t" "pointMatrixMult1.ip";
connectAttr "aimLoc.pm" "pointMatrixMult1.im";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "nParticlePointsSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "goldShaderMTSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "ballShaderMTSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shinyMTSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "nParticlePointsSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "goldShaderMTSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "ballShaderMTSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shinyMTSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "remapHsv1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "baby.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "nukeB.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "valueChoice.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "timeChoice.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "goldShaderMTSG.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "shape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "birail.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "unitConversion1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "nuke.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "ballShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn";
connectAttr "starChoice1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn";
connectAttr "tesselate.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn";
connectAttr "starChoice.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn";
connectAttr "CTLShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn";
connectAttr "plusMinusAverage1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "ifGate.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn";
connectAttr "curveShape5.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn";
connectAttr "ramp2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn";
connectAttr "ifStart.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn";
connectAttr "twinkles.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn";
connectAttr "sparkleMove1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn";
connectAttr "minorChoice.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn";
connectAttr "remapValue1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn";
connectAttr "goldShaderMT.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn";
connectAttr "emitB.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn";
connectAttr "curveShape2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn";
connectAttr "CTL.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn";
connectAttr "ifEnd.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn";
connectAttr "curveShape3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn";
connectAttr "emit.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn";
connectAttr "starShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn";
connectAttr "curveShape4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn";
connectAttr "emitC.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn";
connectAttr "motionMapper.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn";
connectAttr "nParticlePointsSE.pa" ":renderPartition.st" -na;
connectAttr "goldShaderMTSG.pa" ":renderPartition.st" -na;
connectAttr "ballShaderMTSG.pa" ":renderPartition.st" -na;
connectAttr "shinyMTSG.pa" ":renderPartition.st" -na;
connectAttr "npPointsBlinn.msg" ":defaultShaderList1.s" -na;
connectAttr "npPointsVolume.msg" ":defaultShaderList1.s" -na;
connectAttr "goldShaderMT.msg" ":defaultShaderList1.s" -na;
connectAttr "ballShaderMT.msg" ":defaultShaderList1.s" -na;
connectAttr "shinyMT.msg" ":defaultShaderList1.s" -na;
connectAttr "ifStart.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ifEnd.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ifGate.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "timetoUnit24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "starChoice.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "valueChoice.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addEm.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "noiseCond.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "starChoice1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "minorChoice.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapHsv1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "samplerInfo1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "reverse2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multiplyDivide1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "timetoUnit30.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "timeChoice.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "plusMinusAverage1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "sparkleMove1.msg" ":defaultTextureList1.tx" -na;
connectAttr "ramp1.msg" ":defaultTextureList1.tx" -na;
connectAttr "ramp2.msg" ":defaultTextureList1.tx" -na;
connectAttr "ramp3.msg" ":defaultTextureList1.tx" -na;
connectAttr "ramp4.msg" ":defaultTextureList1.tx" -na;
connectAttr "basicShape.iog" ":initialShadingGroup.dsm" -na;
// End of sparkleA.02.ma
