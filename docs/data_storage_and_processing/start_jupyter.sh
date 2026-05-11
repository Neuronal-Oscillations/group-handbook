#!/bin/bash
MEM=16G
CPU=8
TIME="08:00:00"
PARTITION="long"

function help {
    echo "Usage: $0 [-h] [-m MEM] [-c CPUs] [-t TIME] [-p PARTITION]"
    echo "  -h  help"
    echo "  -m  memory (default: $MEM)"
    echo "  -c  CPUs (default: $CPUs)"
    echo "  -t  walltime (default: $TIME)"
    echo "  -p  partition (default: $PARTITION)"
}


while getopts "ht:c:m:p:" opts ; do
    case $opts in
        h) help; exit 0;;
        t) TIME="$OPTARG";;
        m) MEM="$OPTARG";;
        c) CPU="$OPTARG";;
        p) PARTITION="$OPTARG";;
    esac
done

echo "Submitting Jupyter job to ARC (Time: $TIME, CPU: $CPU, Mem: $MEM, Partition: $PARTITION)..."

mkdir -p $DATA/logs
JOBID=$(sbatch --parsable <<EOF
#!/bin/bash
#SBATCH --partition=$PARTITION
#SBATCH --job-name=jupyter
#SBATCH --cpus-per-task=$CPU
#SBATCH --mem=$MEM
#SBATCH --time=$TIME
#SBATCH --output=$DATA/logs/jupyter-%j.log

source \$HOME/.bashrc
source activate \$MNE_ENV_PATH

# Find port and hostname on the compute node
PORT=\$(python -c "import socket; s=socket.socket(); s.bind(('',0)); print(s.getsockname()[1]); s.close()")
HOSTNAME=\$(hostname)

echo "--------------------------------------------------------"
echo "JUPYTER IS STARTING"
echo "NODE: \$HOSTNAME"
echo "PORT: \$PORT"
echo ""
echo "SSH TUNNEL COMMAND:"
echo "ssh -L 8888:\$HOSTNAME:\$PORT -J $USER@gateway.arc.ox.ac.uk $USER@htc-login"
echo ""
echo "URL: http://localhost:8888/tree?token=$USER"
echo "--------------------------------------------------------"

# Execute Jupyter
\$MNE_ENV_PATH/bin/jupyter notebook \
    --no-browser \
    --port=\$PORT \
    --ip=\$HOSTNAME \
    --notebook-dir=$DATA \
    --NotebookApp.token=$USER \
    --NotebookApp.password=''
EOF
)

echo "Submitted job $JOBID — waiting for jupyter..."
LOGFILE=$DATA/logs/jupyter-${JOBID}.log
until [[ -f $LOGFILE ]]; do sleep 2; done
tail -f $LOGFILE
