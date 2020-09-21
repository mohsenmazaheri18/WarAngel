﻿using UnityEngine;
using System.Collections;

public class bl_MouseLook_EHS : MonoBehaviour {
    public enum RotationAxes { MouseXAndY = 0, MouseX = 1, MouseY = 2 }
    public RotationAxes axes = RotationAxes.MouseXAndY;
    public float sensitivityX = 15F;
    public float sensitivityY = 15F;

    public float minimumX = -360F;
    public float maximumX = 360F;

    public float minimumY = -60F;
    public float maximumY = 60F;

    float rotationY = 0F;

    void Update()
    {
        if (axes == RotationAxes.MouseXAndY)
        {
            float rotationX = transform.localEulerAngles.y + ControlFreak2.CF2Input.GetAxis("Mouse X") * sensitivityX;

            rotationY += ControlFreak2.CF2Input.GetAxis("Mouse Y") * sensitivityY;
            rotationY = Mathf.Clamp(rotationY, minimumY, maximumY);

            Vector3 leuler = new Vector3(-rotationY, rotationX, 0);
            transform.localRotation = Quaternion.Slerp(transform.localRotation, Quaternion.Euler(leuler), Time.deltaTime * 32);
        }
        else if (axes == RotationAxes.MouseX)
        {
            transform.Rotate(0, ControlFreak2.CF2Input.GetAxis("Mouse X") * sensitivityX, 0);
        }
        else
        {
            rotationY += ControlFreak2.CF2Input.GetAxis("Mouse Y") * sensitivityY;
            rotationY = Mathf.Clamp(rotationY, minimumY, maximumY);

            transform.localEulerAngles = new Vector3(-rotationY, transform.localEulerAngles.y, 0);
        }
    }

    void Start()
    {
        // Make the rigid body not change rotation
        if (GetComponent<Rigidbody>())
            GetComponent<Rigidbody>().freezeRotation = true;
    }

}
