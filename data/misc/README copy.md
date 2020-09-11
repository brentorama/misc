# keops: Marza KEyframe OPerationS

## Time Modifiers a.k.a DropframeFilter 

The dropframe filter lets you visualize your animation as "stepped" or "on twos"  ("threes", "fours".. )  
This is a non-destructive process.  Your curves do not need to be baked – in fact, it's better for all departments if animators DON'T bake their own curves. 
You can add or remove objects to filters  and use camera offset to eliminate "strobing".  Time filters work with animated objects, alembic caches and cached dynamics. 

## How to use:  

Time filters are in marza-> animation -> Time Filters 

### Python version:

```python -
>>> Import timeFilters.interface 
>>> timeFilters.interface.ConstructUI() 
```

To create a new filter, select the objects you wish to filter and hit the **NEW** button at the top left of the menu 
Objects must be animated or have a cache attached.  Unkeyed / uncached objects will be ignored by the filter.

Filters accept sets – so you can select the controller set and add that to a filter. 
You can also use the Add All feature to add an entire rig to a filter based on any selected part. (Uses rigAbstration)

When you create a dropFrame filter you will be given the option to enter a custom name, and the default "hold" value.  A hold value of 2 will create a filter with time on "twos"  You can specify if you want the new filter to be built out of the current selection  (objects or sets)

The dropdown menu (RMB In the filter list) has all the basic options but includes extended options like Duplicate, Rename and xKill.   
Enable / disable filter overrides the keyable enable channel – use this to deactivate a filter, regardless of its keyed state. 

**Refresh Filter can be used when you've keyed channels in a filtered object that weren't keyed when the filter was created.**

1. An object can be in only one filter at a time 

2. A filter cannot be in another filter 

3. Filters work with animated nodes – currently supported are transforms, mzAlembic, alembic and nParticles.   

4. The hold channel will not allow itself to be unkeyed. 

1. You should rename filters using the UI Rename option 

1. You must delete filters through the UI [X] button, manual deletion can cause problems. 

1. If you wish to delete all dropFrame nodes from your scene (For example if some nodes have broken) – use the xKill function in the dropdown menu of the time Modifier list, this will nuke the filters into the stone age. 

## Camera Offset:
**[Sample Video](https://www.youtube.com/watch?v=tJnKAUA7HB4)**

For scenes with moving cameras – the Camera Offset eliminates the strobing effect when a rig is filtered but a camera is not.  For most cases, simply hit the camera offset button with a filter selected.   

If this does not work it means the moving asset does not have a "Camera offset node". You will need to specify a rig control to use.  Usually a root node or subroot node, anything that moves the entire rig and has translate, rotate and scale unlocked.  

## How to: 

1. Choose a filter from the ui,  

1. Select a control object you wish to use as an offsetter,  

1. Hit the camera offset button in the ui   

1. Make sure the correct camera is selected in your filter.camera channel 

## Cool Zone 

```python -
>>> import dropFrameFilter 
>>> import dropFrameFilter.interface 
>>> import dropFrameFilter.functions 
>>> import das 

>>> dropFrameFilter.Construct()  # Builds a dict of instances based on BuildFromNode 
>>> dropFrameFilter.Delete() 
>>> dropFrameFilter.DropFrameFilter()   # Make a new filter  
>>> dropFrameFilter.Export() 
>>> dropFrameFilter.Import() 
>>> dropFrameFilter.Mode() 
>>> dropFrameFilter.xKill() 

>>> flt = dropFrameFilter.DropFrameFilter(name = "Captain Dick") 
>>> flt.AddToFilter() 
>>> flt.Build(hold=1, flavor="stepKey", objects=[]) #creates nodes from class 
>>> flt.BuildFromNode() #initializes an instance of the class from a node 
>>> flt.CreateOffset() 
>>> flt.DeleteOffset() 
>>> flt.Duplicate() 
>>> flt.Empty() 
>>> flt.GetAllAnimNodes() 
>>> flt.GetAnimData() # Returns all animated plugs of a node - traverses anim layers
>>> flt.GetFilteredNodePlugs() 
>>> flt.ReconnectHold() 
>>> flt.RemoveAll() # Empty the filter
>>> flt.RemoveFromFilter() #Remove specific objects from filter
>>> flt.Rename() 
>>> flt.ScriptJob() 
>>> flt.Serialize() 
>>> flt.Toggle() 
>>> flt.Update() 
>>> flt.UpdateCameras()

>>> dff = dropFrameFilter.interface.CreateUI() 
>>> filterA = dff.filters["EnemyA"] 
>>> keyableA = filterA.Serialize().keyable 
>>> das.pprint(keyableA) 

```

## BakeKeyFrames 

Depreciated - to be replaced in Time Filters

## CreatePreviewStepCurve (obsolete) 

Depreciated - to be replaced in Time Filters