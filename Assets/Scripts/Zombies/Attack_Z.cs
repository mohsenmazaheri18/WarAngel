using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Attack_Z : MonoBehaviour
{
     void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("player_Z"))
        {
           other.GetComponent<PlayerHealthInZMode>().TakeDamageHead();
        }
    }
}
