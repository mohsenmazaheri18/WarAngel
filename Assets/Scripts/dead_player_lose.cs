using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
public class dead_player_lose : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {

        StartCoroutine(time());
    }
    IEnumerator time()
    {
        yield return new WaitForSeconds(3f);
        SceneManager.LoadScene("Mission1");
    }
}
