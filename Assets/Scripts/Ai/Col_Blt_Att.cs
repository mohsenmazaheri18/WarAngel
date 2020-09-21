using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Col_Blt_Att : MonoBehaviour
{
    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            other.GetComponent<ThirdPersonDemoLPFP>().Patrolnakon();
        }
    }
    
}
