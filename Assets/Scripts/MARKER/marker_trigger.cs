using UnityEngine;

public class marker_trigger : MonoBehaviour
{
    public GameObject money;
    public GameObject cube;

    //Enemy
    public GameObject mission;

    public GameObject mission1;

    //money1
    public GameObject mission2;
    public GameObject mission3;



    // Start is called before the first frame update

    private void Update()
    {
        if (GameObject.FindGameObjectWithTag("Enemy") == false)
        {
            mission.SetActive(true);
            mission1.SetActive(true);
        }
    }

    private void OnTriggerEnter(Collider other)
    {

        if (other.CompareTag("Player"))
        {
            Destroy(money);
            Destroy(cube);
            mission2.SetActive(true);
            mission3.SetActive(true);

        }
    }
}
