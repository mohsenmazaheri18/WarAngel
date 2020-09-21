using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerHealthInZMode : MonoBehaviour
{
    public int healthenemy = 10;
    public GameObject enemyy;
    public GameObject dead;

    public void TakeDamage()
    {
        healthenemy -= 1;

        if (healthenemy <= 0)
        {
            healthenemy = 0;
            Destroy(enemyy);
            Instantiate(dead, enemyy.transform.position, enemyy.transform.rotation);
        }
    }

    public void TakeDamageHead()
    {
        healthenemy -= 10;
        if (healthenemy <= 0)
        {
            healthenemy = 0;
            Destroy(enemyy);
            Instantiate(dead, enemyy.transform.position, enemyy.transform.rotation);
        }
    }

    public void OnCollisionEnter(Collision other)
    {

            TakeDamageHead();
        
    }

    public void OnTriggerEnter(Collider other){

            TakeDamageHead();
        
    }
}
