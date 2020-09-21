using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Time_Scale_game : MonoBehaviour
{


    public void scale1()
    {
        Time.timeScale = 0f;
    }

    public void scale2()
    {
        Time.timeScale = 1f;
    }

    public void exit()
    {
        Application.Quit();
    }

}
