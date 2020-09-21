using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Video_in_first : MonoBehaviour
{

    public GameObject black;

    public GameObject aval;

    public GameObject dovom;

    
    
    public GameObject cutlevel;
    public GameObject canvass;
    
    
    
    public GameObject enemy;
    public GameObject CONNECTS;
    public GameObject CF;
    public GameObject voice;
    public GameObject van;
    public GameObject timer;
    public GameObject marker;
    public GameObject uimanr;
    private void Start()
    {
        StartCoroutine(cutsene());
        StartCoroutine(cutsene2());
        StartCoroutine(blackwidow());
        StartCoroutine(cutsene3());
        
    }

    IEnumerator cutsene()
    {
        yield return new WaitForSeconds(27f);
        Destroy(aval);
        black.SetActive(true);



    }

    IEnumerator cutsene2()
    {
        yield return new WaitForSeconds(29f);
        black.SetActive(false);
        dovom.SetActive(true);

    }
    IEnumerator blackwidow()
    {
        
        yield return new WaitForSeconds(50f);
        black.SetActive(true);
    }

    
    IEnumerator cutsene3()
    {
        
        yield return new WaitForSeconds(52f);
        Destroy(dovom);
        cutlevel.SetActive(false);
        canvass.SetActive(false);
        enemy.SetActive(true);
        CONNECTS.SetActive(true);
        CF.SetActive(true);
        voice.SetActive(true);
        van.SetActive(true);
        timer.SetActive(true);
        marker.SetActive(true);
        black.SetActive(false);
    }

    public void next_skip()
    {
        cutlevel.SetActive(false);
        canvass.SetActive(false);
        enemy.SetActive(true);
        CONNECTS.SetActive(true);
        CF.SetActive(true);
        voice.SetActive(true);
        van.SetActive(true);
        timer.SetActive(true);
        marker.SetActive(true);
        black.SetActive(false);
        uimanr.SetActive(true);
    }
}
