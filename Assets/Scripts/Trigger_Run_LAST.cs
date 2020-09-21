using System;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Trigger_Run_LAST : MonoBehaviour
{
    public GameObject black;

    public GameObject audio_last;
    public GameObject audio1;
    public GameObject audio2;
    public GameObject audio3;
    public GameObject playerr;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(last());
        StartCoroutine(last2());

    }

    
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player")) ;
        {
            black.SetActive(true);
            audio_last.SetActive(true);
            StartCoroutine(last());
            audio1.SetActive(true);
            Destroy(playerr);
                    StartCoroutine(last3());
        }

    }

    IEnumerator last()
    {
        yield return new WaitForSeconds(3f);
        audio2.SetActive(true);

    }

    IEnumerator last2()
    {
        yield return new WaitForSeconds(5f);
        audio3.SetActive(true);
    }
    
    IEnumerator last3()
    {
        yield return new WaitForSeconds(3f);
        SceneManager.LoadScene("LoadingScreen");
    }
    
}
