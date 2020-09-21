using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class collider_cube_health : MonoBehaviour
{
    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Finish"))
        {
            Debug.Log("col");
            other.gameObject.GetComponent<PlayerHealthInZMode>().TakeDamageHead();
        }

    }
}
