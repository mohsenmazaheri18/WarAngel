using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Mime;
using UnityEngine;
using UnityEngine.UI;

public class Door_OPEN : MonoBehaviour
{
    public Animator door;
    public GameObject open;
    public GameObject close;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            door.Play("open-door");
        }

    }

    private void OnTriggerExit(Collider col)
    {

        if (col.CompareTag("Player"))
        {
            door.Play("close-door");
        }

    }
}
