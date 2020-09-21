using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class enemys : MonoBehaviour
{

    NavMeshAgent agent;
    public GameObject player;
    public Animator anim;
    public GameObject enemy;


    // Use this for initialization
    void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        player = GameObject.FindGameObjectWithTag("Player");
        anim = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Vector3.Distance(transform.position, player.transform.position) < 20)
        {
            anim.SetBool("attack",false);
            agent.speed = 4f;
            agent.SetDestination(player.transform.position);

            if (Vector3.Distance(transform.position, player.transform.position) < 2.5f)
            {
                anim.SetBool("attack",true);
                agent.speed = 0f;
                enemy.transform.rotation = Quaternion.Lerp(
                    enemy.transform.rotation,
                    Quaternion.LookRotation(player.transform.position -
                                            enemy.transform.position),
                    3f * Time.deltaTime);

            }
        }
    }
}