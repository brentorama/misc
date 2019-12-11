using UnityEngine;
using System.Collections;

public class DemoScript : MonoBehaviour{

    public Light myLight;

    void Update() {
        if(Input.GetKeyDown("space")){
            myLight.enabled = true;
        }
        if (Input.GetKyUp("space"){
            myLight.enabled = false;
        }
    }
}