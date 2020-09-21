using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class instss : MonoBehaviour
{

    public GameObject enemy;
    public GameObject CONNECTS;
    public GameObject CF;
    public GameObject voice;

    // Start is called before the first frame update
    void Start()
    {

        INS();
        
    }

    // Update is called once per frame
    void Update()
    {
       
    }


    IEnumerator INS()
    {
        
        yield return new WaitForSeconds(10f);
        
        enemy.SetActive(true);
        CONNECTS.SetActive(true);
        CF.SetActive(true);
        voice.SetActive(true);
    }
    
}
