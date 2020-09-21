using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class trigger_Enemy_Att : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            other.GetComponent<ThirdPersonDemoLPFP>().Patrolnakon();
        }

    }
}
