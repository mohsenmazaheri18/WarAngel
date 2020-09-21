using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class enemyssss : MonoBehaviour
{
    NavMeshAgent agent;
    public GameObject player;

    private Animator anim;

    // Start is called before the first frame update
    void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        player = GameObject.FindGameObjectWithTag("Player");
    }

    // Update is called once per frame
    void Update()
    {
        if (Vector3.Distance(transform.position, player.transform.position) < 30)
        {
            agent.speed = 2f;
            agent.SetDestination(player.transform.position);

            if (Vector3.Distance(transform.position, player.transform.position) < 20)
            {

                agent.speed = 0;
            }
        }
        
    }
}
