using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Dead_Boss : MonoBehaviour
{
    public GameObject trigakhar;
    public GameObject me;
    public GameObject audioasli;
    public GameObject audiolast;
    public GameObject audioalarm;
    public GameObject complete1;
    public GameObject complete2;
    public GameObject enemyfast;
    void Update()
    {
        if (GameObject.FindGameObjectWithTag("boss") == true)
        {
            trigakhar.SetActive(true);
            me.SetActive(true);
            audioasli.SetActive(false);
            audiolast.SetActive(true);
            audioalarm.SetActive(true);
            complete1.SetActive(false);
            complete2.SetActive(false);
            enemyfast.SetActive(true);
        }
    }
}
